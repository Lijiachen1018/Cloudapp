from django.conf.urls import patterns, url, include
#from django.contrib import admin
#admin.autodiscover()

from mysite import views

urlpatterns = patterns('',
    #(r'^admin/', include(admin.site.urls)),
    ('^$', views.Homepage),
    (r'^books/', include('books.urls')),
    ('^Homepage/$', views.Homepage),
    #('^grouplist/$', views.grouplist),
)