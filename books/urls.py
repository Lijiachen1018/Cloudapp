from django.conf.urls import patterns, url
from books import views

urlpatterns = patterns('',
    url(r'^$', views.login, name='login'),
    url(r'^login/$', views.login, name='login'),
    url(r'^regist/$', views.regist, name='regist'),
    url(r'^index/$', views.index, name='index'),
    url(r'^logout/$', views.logout, name='logout'),
    ('^create_new_group/$', views.create_new_group),
    ('^homepage/$', views.homepage),
    ('^group_detail/$', views.group_detail),
    ('^grouplist/$', views.grouplist),
    ('^my_group/$', views.my_group),
    ('^group_detail_organiser/$', views.group_detail_organiser),
    ('^myGroupDetail_member/$', views.group_detail_member),
    ('^regist/$', views.regist),
)