from django import forms
from ckeditor.fields import RichTextFormField
from blog import var as blog_var


class formArticle(forms.Form):
    title = forms.CharField(max_length=blog_var.titleMaxlen, required=True)
    content = RichTextFormField()


class formComment(forms.Form):
    comment = forms.CharField(max_length=blog_var.commentMaxlen, required=True)
