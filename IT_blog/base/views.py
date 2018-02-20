from django.shortcuts import render
from base import func as base_func
from blog import func as blog_func

def index(request):
    list = {}
    list['articles'] = {}

    back = blog_func.getAllArticle()

    if back['pass']:
        back = base_func.dividePage(request.GET, back['get'])
        try:
            list['pageCount'] = back['pageCount']
        except:
            list['pageCount'] = 1
        if back['pass']:
            list['articles'] = back['output']

    return render(request, 'index.html', list)
