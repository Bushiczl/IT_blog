from django.shortcuts import render
from blog import func as blog_func

def index(request):
    list = {}
    list['articles'] = None

    back = blog_func.getAllArticle()

    if back['pass']:
        list['articles'] = back['get']

    return render(request, 'index.html', list)
