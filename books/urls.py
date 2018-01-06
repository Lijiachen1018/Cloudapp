from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.login, name='login'),
    url(r'^Login/$', views.login, name='login'),
    url(r'^regist/$', views.regist, name='regist'),
    url(r'^index/$', views.index, name='index'),
    url(r'^logout/$', views.logout, name='logout'),
    url('^create_new_group/$', views.create_new_group),
    url('^homepage/$', views.homepage),
    url('^group_detail/$', views.group_detail),
    url('^groupList/$', views.grouplist),
    url('^my_group/$', views.my_group),
    url('^myGroupDetail_organiser/$', views.group_detail_organiser),
    url('^myGroupDetail_member/$', views.group_detail_member),
    url('^regist/$', views.regist),
]