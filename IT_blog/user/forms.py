from django import forms


class formRegister(forms.Form):
    username = forms.CharField(max_length=30)
    passwordFirst = forms.CharField(max_length=30)
    passwordConfirm = forms.CharField(max_length=30)