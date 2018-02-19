from blog import var as blog_v
from base import func as base_func
from blog import models as blog_models
import time

def judgeTitle(input):
    str = input
    strlen = len(str)
    if strlen < 1:
        return u"标题不能为空"
    if not base_func.judgeStringBlack(str, "", blog_v.titleMaxlen):
        return u"标题不能超过30个字符"
    return ""


def addArtile(title, content, owner):
    back = {}
    back['pass'] = False
    back['str'] = ""
    judge = judgeTitle(title)
    if judge != "":
        back['str'] =judge
        return back
    try:
        datetime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        newArticle = blog_models.article(title=title, content=content, owner=owner, date=datetime)
        newArticle.save()
        back['str'] = u"成功"
        back['pass'] = True
    except:
        back['str'] = u"失败，发生未知错误"
    return back


def getArticleFromOwnerId(ownerId):
    back = {}
    try:
        get = blog_models.article.objects.filter(owner=ownerId).order_by('-date')
        back['pass'] = True
        back['get'] = get
    except:
        back['pass'] = False
    return back

def getAllArticle():
    back = {}
    try:
        get = blog_models.article.objects.all().order_by('-date')
        back['pass'] = True
        back['get'] = get
    except:
        back['pass'] = False
    return back


def extentArticleId(articleId):
    back = {}
    try:
        get = blog_models.article.objects.get(id=articleId)
        back['title'] = get.title
        back['content'] = get.content
        back['owner'] = get.owner
        back['date'] = get.date
        back['isArticle'] = True
        back['id'] = articleId
    except:
        back['isArticle'] = False
    return back


def changeArticle(title, content, articleId):
    back = {}
    back['str'] = ""
    back['pass'] = False
    try:
        datetime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        blog_models.article.objects.filter(id=articleId).update(content=content, title=title, date=datetime)
        back['str'] = "修改成功"
        back['pass'] = True
    except:
        back['str'] = "这篇文章可能已被删除"
    return back


def deleteArticle(articleId):
    back = {}
    back['pass'] = False
    back['str'] = ""
    try:
        blog_models.article.objects.get(id=articleId).delete()
        back['pass'] = True
    except:
        back['str'] = u"删除成功"
    return back


def addComment(ownerName, comment, articleId):
    back = {}
    back['pass'] = False
    back['str'] = ""
    try:
        datetime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        newComment = blog_models.comment(owner=ownerName, comment=comment, article=articleId, date=datetime)
        newComment.save()
        back['str'] = u"成功"
        back['pass'] = True
    except:
        back['str'] = u"失败，发生未知错误"
    return back


def getCommentFromArticleId(articleId):
    back = {}
    try:
        get = blog_models.comment.objects.filter(article=articleId).order_by('-date')
        back['get'] = get
        back['pass'] = True
    except:
        back['pass'] = False
    return back