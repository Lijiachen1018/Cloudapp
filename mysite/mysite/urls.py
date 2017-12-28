from django.conf.urls import patterns, url, include
# The following part is used for practice.
from mysite.views import hello, my_homepage_view, current_datetime, hours_ahead
# this part is our app
from mysite.views import create_new_group, Homepage,Forgot, group_detail, group_list,Login, sign_up

urlpatterns = patterns('',
    ('^hello/$', hello),
    ('^$', my_homepage_view),
    ('^time/$', current_datetime),
    (r'^time/plus/(\d{1,2})/$', hours_ahead),
    ('^create_new_group/$', create_new_group),
    ('^Homepage/$', Homepage),
    ('^Forgot/$', Forgot),
    ('^group_detail/$', group_detail),
    ('^group_list/$', group_list),
    ('^Login/$', Login),
    ('^sign_up/$', sign_up),
)

