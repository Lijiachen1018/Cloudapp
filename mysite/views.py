from django.shortcuts import render_to_response
from django.http import HttpResponse

# The following part is used for practice
import datetime

def hello(request):
    return HttpResponse("Hello world")

def my_homepage_view(request):
    return HttpResponse('Welcome')

def hours_ahead(request, offset):
    try:
        offset = int(offset)
    except ValueError:
        raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)

def current_datetime(request):
    now = datetime.datetime.now()
    return render_to_response('current_datetime.html', {'current_date': now})

# this part is our app
def create_new_group(request):
    return render_to_response('create_new_group.html', {})

def Homepage(request):
    return render_to_response('Homepage.html', {})

def Forgot(request):
    return render_to_response('Forgot.html', {})

def group_list(request):
    return render_to_response('group_list.html', {})

def group_detail(request):
    return render_to_response('group_detail.html', {})

def Login(request):
    return render_to_response('Login.html', {})

def sign_up(request):
    return render_to_response('sign_up.html', {})

def search_form(request):
    return render_to_response('search_form.html')

def search(request):
    if 'q' in request.GET:
        message = 'You searched for: %r' % request.GET['q']
    else:
        message = 'You submitted an empty form.'
    return HttpResponse(message)
'''
def show_color(request): 
    if "favorite_color" in request.COOKIES: 
        return HttpResponse("Your favorite color is %s" %request.COOKIES["favorite_color"]) 
    else: 
        return HttpResponse("You don't have a favorite color.")

def set_color(request):
    if "favorite_color" in request.GET:
        response = HttpResponse("Your favorite color is now %s" %request.GET["favorite_color"])
        response.set_cookie("favorite_color",request.GET["favorite_color"])
        return response
    else:
        return HttpResponse("You didn't give a favorite color.")

'''
