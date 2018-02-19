from django.db import models
from ckeditor.fields import RichTextField
from blog import var as blog_v
from user import var as user_v

class article(models.Model):
    title = models.CharField(max_length=blog_v.titleMaxlen)
    content = RichTextField(config_name='default')
    owner = models.IntegerField()
    date = models.DateTimeField()

    def __str__(self):
        return self.title


class comment(models.Model):
    owner = models.CharField(max_length=user_v.usernameMaxlen)
    article = models.IntegerField()
    comment = models.CharField(max_length=blog_v.commentMaxlen)
    date = models.DateTimeField()
