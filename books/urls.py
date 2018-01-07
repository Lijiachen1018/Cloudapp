from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.login, name='login'),
    url(r'^Login/$', views.login, name='login'),
    url(r'^regist/$', views.regist, name='regist'),
    url(r'^index/$', views.index, name='index'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^create_new_group/$', views.create_new_group, name = 'createnewgroup'),
    url(r'^homepage/$', views.homepage,name= 'homepage'),
    url(r'^group_detail/$', views.group_detail,name = 'group_detail'),
    url(r'^groupList/$', views.grouplist,name ='grouplist'),
    url(r'^my_group/$', views.my_group,name = 'my_group'),
    url(r'^myGroupDetail_organiser/$', views.group_detail_organiser,name='group_detail_organiser'),
    url(r'^myGroupDetail_member/$', views.group_detail_member,name='group_detail_member'),
    url(r'^regist/$', views.regist,name='regist'),
]