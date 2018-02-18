from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.urls import reverse
import logging
from user import func as user_func
from .models import article
from .forms import formArticle
from blog import func as blog_func

def home(request, ownerId):
    list = {}
    list['isUser'] = False
    list['isOwner'] = False
    list['ownerName'] = ""
    list['articles'] = None
    list['haveArticles'] = False
    owner = user_func.extentId(ownerId)

    if not owner['isUser']:
        list['isUser'] = False
        return render(request, 'home.html', list)
    else:
        list['isUser'] = True
        list['ownerName'] = owner['username']

    if 'id' in request.session:
        guestId = request.session['id']
    else:
        guestId = -1

    logging.debug(u'浏览者id为' + str(guestId))
    logging.debug(u'博主id为' + str(ownerId))
    if int(guestId) == int(ownerId):
        list['isOwner'] = True
    else:
        list['isOwner'] = False

    back = blog_func.getArticleFromOwnerId(ownerId)

    if back['pass']:
        list['articles'] = back['get']
        list['haveArticles'] =True

    return render(request, 'home.html', list)


def newArticle(request):
    list = {}
    list['message'] = ""

    if 'id' in request.session:
        guestId = request.session['id']
    else:
        guestId = -1
    if guestId == -1:
        return redirect(reverse('index'))

    if request.method == 'POST':
        form = formArticle(request.POST)
        if form.is_valid():
            owner = guestId
            title = form.cleaned_data['title']
            content = form.cleaned_data['content']
            back = blog_func.addArtile(title, content, owner)

            if back['pass']:
                return redirect(reverse('home', args=(int(owner),)))
            else:
                list['message'] = back['str']
                return render(request, 'newArticle.html', list)
        else:
            list['message'] = u"输入数据不合法"
    else:
        form = formArticle()

    list['form'] = form
    return render(request, 'newArticle.html', list)


def showArticle(request, articleId):
    list = {}
    list['ownerName'] = ""
    list['isOwner'] = False
    list['ownerId'] = -1
    list['isArticle'] = False
    list['title'] = ""
    list['content'] = ""
    list["date"] = ""
    list["articleId"] = articleId
    if 'id' in request.session:
        guestId = request.session['id']
    else:
        guestId = -1

    back = blog_func.extentArticleId(articleId)
    if back['isArticle']:
        list['isArticle'] = True
        owner = user_func.extentId(back['owner'])
        list['ownerName'] = owner['username']
        if guestId == owner['id']:
            list['isOwner'] = True
        list['title'] = back['title']
        list['content'] = back['content']
        list['ownerId'] = owner['id']
        list["date"] = back['date']

    return render(request, 'showArticle.html', list)


def changeArticle(request, articleId):
    list = {}
    list['message'] = ""
    if 'id' in request.session:
        guestId = request.session['id']
    else:
        guestId = -1

    back = blog_func.extentArticleId(articleId)
    if not back['isArticle']:
        return HttpResponse(u"文章404")
    if guestId != back['owner']:
        return HttpResponse(u"你不能修改这篇文章")

    if request.method == 'POST':
        form = formArticle(request.POST)
        logging.debug(request.POST)
        if form.is_valid():
            title = form.cleaned_data['title']
            content = form.cleaned_data['content']
            back = blog_func.changeArticle(title, content, articleId)

            if back['pass']:
                return redirect(reverse('showArticle', args=(articleId,)))
            else:
                list['message'] = back['str']
                return render(request, 'newArticle.html', list)
        else:
            list['message'] = u"输入数据不合法"
    else:
        form = formArticle({'title': back['title'], 'content': back['content']})

    list['form'] = form
    return render(request, 'newArticle.html', list)