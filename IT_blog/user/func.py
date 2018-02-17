from user import var as u_v
from base import var as b_v
from base import func as base_func
from .models import user
import logging

def judgeUsername(input):
    str = input
    strlen = len(str)
    logging.debug(strlen)
    if strlen < u_v.usernameMinlen:
        return False
    if not base_func.judgeStringWhite(str, b_v.chAlphaLow + b_v.chAlphaHigh + b_v.chNum + "_", u_v.usernameMaxlen):
        return False
    return True


def judgePassword(input):
    str = input
    strlen = len(str)
    logging.debug(strlen)
    if strlen < u_v.passwordMinlen:
        return False
    if not base_func.judgeStringWhite(str, b_v.chAlphaLow + b_v.chAlphaHigh + b_v.chNum + "_", u_v.passwordMaxlen):
        return False
    logging.debug('succsess')
    return True


def getUser(request):
    if 'username' in request.session:
        backString = request.session['username']
        login = True
        id = request.session['id']
    else:
        backString = u"访客"
        login = False
        id = -1
    return {'username': backString, 'login': login, 'id': id}


def extentId(id):
    back = {}
    try:
        get = user.objects.get(id=id)
        back['username'] = get.username
        back['isUser'] = True
        back['id'] = id
        logging.debug(get.username)
    except:
        back['isUser'] = False
    return back

