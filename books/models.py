from django.db import models

'''STATUS_CHOICES = (
    ('u', 'un_go'),
    ('d', 'done'),
)'''


class User(models.Model):
    email = models.EmailField(null=True, blank=True)
    username = models.CharField(max_length=30, default='DEFAULT VALUE')
    password = models.CharField(max_length=128, default='DEFAULT VALUE')
    firstname = models.CharField(max_length=30, null=True, blank=True)
    lastname = models.CharField(max_length=30, null=True, blank=True)

    def __str__(self):
        return self.username


class Country(models.Model):
    c_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    c_url_photo = models.URLField(default='DEFAULT VALUE')

    def __str__(self):
        return self.c_name


class City(models.Model):
    ct_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    ct_country = models.ForeignKey(Country, related_name='City_Country')

    def __str__(self):
        return self.ct_name


class Group(models.Model):
    g_name = models.CharField(max_length=30,default='DEFAULT VALUE')
    g_organiser = models.ForeignKey(User, related_name='user_organiser')
    g_member = models.CharField(max_length=100, default='DEFAULT VALUE')
    g_place = models.ForeignKey(City, related_name='group_gatherplace')
    g_city = models.ForeignKey(City, related_name='group_city')
    g_content = models.TextField(max_length=100, null=True, blank=True)
    g_state = models.CharField(max_length=1, default='DEFAULT VALUE')
    g_country = models.ForeignKey(Country, related_name='group_country')
    g_createdtime = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return self.g_name


class Comment(models.Model):
    article = models.ForeignKey(Group, related_name='article_comment')
    detail = models.TextField(max_length=128,default='DEFAULT VALUE')
    user = models.ForeignKey(User, related_name='user_comment')
    created_time = models.DateTimeField(auto_now_add=True, null=True, blank=True)

    def __str__(self):
        return self.detail


class GroupMember(models.Model):
    gm_member = models.ManyToManyField(User, related_name='member_group')
    gm_group = models.ForeignKey(Group, related_name='user_group')



