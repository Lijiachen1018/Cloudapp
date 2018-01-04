from django.db import models


class User(models.Model):
    email = models.EmailField(blank=False,default='DEFAULT VALUE')
    username = models.CharField(max_length=30,default='DEFAULT VALUE')
    password = models.CharField(max_length=128,default='DEFAULT VALUE')
    firstname = models.CharField(max_length=30,default='DEFAULT VALUE')
    lastname = models.CharField(max_length=30,default='DEFAULT VALUE')


class Country(models.Model):
    c_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    c_url_photo = models.URLField(default='DEFAULT VALUE')


class City(models.Model):
    ct_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    ct_country = models.ForeignKey(Country, related_name='City_Country')


class Group(models.Model):
    g_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    g_organiser = models.ForeignKey(User, related_name='user_organiser')
    g_member = models.CharField(blank=False,default='DEFAULT VALUE')
    g_place = models.ForeignKey(City, related_name='group_gatherplace')
    g_city = models.ForeignKey(City, related_name='group_city')
    g_content = models.TextField(max_length=100,default='DEFAULT VALUE')
    g_state = models.IntegerField('In a team or completed',default='DEFAULT VALUE')
    g_country = models.ForeignKey(Country, related_name='group_country')
    g_createdtime = models.DateTimeField(default='DEFAULT VALUE')


class Comment(models.Model):
    article = models.ForeignKey(Group, related_name='article_comment')
    detail = models.TextField(max_length=128,default='DEFAULT VALUE')
    user = models.ForeignKey(User, related_name='user_comment')
    created_time = models.DateTimeField(default='DEFAULT VALUE')


class GroupMember(models.Model):
    gm_member = models.ManyToManyField(User, related_name='member_group')
    gm_group = models.ForeignKey(Group, related_name='user_group')



