from django.db import models

'''
class Publisher(models.Model):
    name = models.CharField(max_length=30)
    address = models.CharField(max_length=50)
    city = models.CharField(max_length=60)
    state_province = models.CharField(max_length=30)
    country = models.CharField(max_length=50)
    website = models.URLField()


class Author(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=40)
    email = models.EmailField()


class Book(models.Model):
    title = models.CharField(max_length=100)
    authors = models.ManyToManyField(Author)
    publisher = models.ForeignKey(Publisher)
    publication_date = models.DateField()

class User(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)

'''
class User(models.Model):
    phone = models.CharField(max_length=30)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=128)
    firstname = models.CharField(max_length=30)
    lastname = models.CharField(max_length=30)


class Country(models.Model):
    c_name = models.CharField(max_length=30)


class City(models.Model):
    ct_name = models.CharField(max_length=30)
    ct_country = models.ForeignKey(Country, related_name='City_Country')


class Group(models.Model):
    g_name = models.CharField(max_length=30)
    g_organiser = models.ForeignKey(User, related_name='user_organiser')
    g_member = models.CharField(max_length=100,blank=False)
    g_place = models.ForeignKey(City, related_name='group_gatherplace')
    g_city = models.ForeignKey(City, related_name='group_city')
    g_content = models.TextField(max_length=100)
    g_state = models.IntegerField('In a team or completed')
    g_country = models.ForeignKey(Country, related_name='group_country')


class Comment(models.Model):
    article = models.ForeignKey(Group, related_name='article_comment')
    detail = models.TextField(max_length=128)
    user = models.ForeignKey(User, related_name='user_comment')


class GroupMember(models.Model):
    gm_member = models.ManyToManyField(User, related_name='member_group')
    gm_group = models.ForeignKey(Group, related_name='user_group')
