from django.shortcuts import render

def getModel(request):
    return render(request, 'base.html')
