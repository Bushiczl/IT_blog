from django.db import models
from ckeditor.fields import RichTextField
from blog import var as blog_v

class article(models.Model):
    title = models.CharField(max_length=blog_v.titleMaxlen)
    content = RichTextField(config_name='default')
    owner = models.IntegerField()
    date = models.DateTimeField()

    def __str__(self):
        return self.title
