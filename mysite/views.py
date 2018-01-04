from django.shortcuts import render_to_response
#from django.http import HttpResponse



def Homepage(request):
    return render_to_response('Homepage.html', {})

#def grouplist(req):
   # return render_to_response('groupList.html',{})