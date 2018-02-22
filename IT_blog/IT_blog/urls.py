"""IT_blog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from field import views as field_views
from user import views as user_views
from base import views as base_views
from blog import views as blog_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^login/$', user_views.login, name='login'),
    url(r'^register/$', user_views.register, name='register'),
    url(r'^logout/$', user_views.logout, name='logout'),
    url(r'^index/$', base_views.index, name='index'),
    url(r'^home/(\d+)/$', blog_views.home, name='home'),
    url(r'^newArticle/$', blog_views.newArticle, name='newArticle'),
    url(r'^article/(\d+)/$', blog_views.showArticle, name='showArticle'),
    url(r'^change/(\d+)/$', blog_views.changeArticle, name='changeArticle'),
    url(r'^deleteArticle/(\d+)/$', blog_views.deleteArticle, name='deleteArticle'),
    url(r'^identifyImg/$', base_views.identifyCodePicture, name='identifyImg'),
    url(r'^changePwd/$', user_views.changePwd, name='changePwd'),

    url(r'ckeditor/', include('ckeditor_uploader.urls')),
    url(r'^field/getModel/$', field_views.getModel, name='1'),
]
