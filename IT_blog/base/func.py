from django.shortcuts import render, redirect
from django.urls import reverse

def judgeStringWhite(input, chSet, maxlen = -1):
    if maxlen != -1:
        strlen = len(str(input))
        if strlen > maxlen:
            return False
    for ch in input:
        if not ch in chSet:
            return False
    return True


def judgeStringBlack(input, chSet, maxlen = -1):
    if maxlen != -1:
        strlen = len(str(input))
        if strlen > maxlen:
            return False
    for ch in input:
        if ch in chSet:
            return False
    return True
