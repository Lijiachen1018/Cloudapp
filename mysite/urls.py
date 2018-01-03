from django.conf.urls import patterns, url, include
from django.contrib import admin
admin.autodiscover()

from mysite import views
# The following part is used for practice.
#from mysite.views import hello, my_homepage_view, current_datetime, hours_ahead
# this part is our app
#from mysite.views import create_new_group, Homepage,Forgot, group_detail, group_list,Login, sign_up

urlpatterns = patterns('',
    (r'^admin/', include(admin.site.urls)),
    ('^hello/$', views.hello),
    ('^$', views.my_homepage_view),
    ('^time/$', views.current_datetime),
    (r'^time/plus/(\d{1,2})/$', views.hours_ahead),
    ('^create_new_group/$', views.create_new_group),
    ('^Homepage/$', views.Homepage),
    ('^Forgot/$', views.Forgot),
    ('^group_detail/$', views.group_detail),
    ('^group_list/$', views.group_list),
    ('^Login/$', views.Login),
    ('^sign_up/$', views.sign_up),
    (r'^search-form/$', views.search_form),
    (r'^search/$', views.search),
    #('^set_color/$', views.set_color),
    #('^show_color/$', views.show_color),
    (r'^books/', include('books.urls')),

)

