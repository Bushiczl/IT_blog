from django import forms
from ckeditor.fields import RichTextFormField


class formArticle(forms.Form):
    title = forms.CharField(max_length=30, required=True)
    content = RichTextFormField()
