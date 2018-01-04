# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('ct_name', models.CharField(default=b'DEFAULT VALUE', max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('detail', models.TextField(default=b'DEFAULT VALUE', max_length=128)),
                ('created_time', models.DateTimeField(auto_now_add=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('c_name', models.CharField(default=b'DEFAULT VALUE', max_length=30)),
                ('c_url_photo', models.URLField(default=b'DEFAULT VALUE')),
            ],
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('g_name', models.CharField(default=b'DEFAULT VALUE', max_length=30)),
                ('g_member', models.CharField(default=b'DEFAULT VALUE', max_length=100)),
                ('g_content', models.TextField(max_length=100, null=True, blank=True)),
                ('g_state', models.CharField(default=b'DEFAULT VALUE', max_length=1)),
                ('g_createdtime', models.DateTimeField(auto_now_add=True, null=True)),
                ('g_city', models.ForeignKey(related_name='group_city', to='books.City')),
                ('g_country', models.ForeignKey(related_name='group_country', to='books.Country')),
            ],
        ),
        migrations.CreateModel(
            name='GroupMember',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('gm_group', models.ForeignKey(related_name='user_group', to='books.Group')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('email', models.EmailField(max_length=254, null=True, blank=True)),
                ('username', models.CharField(default=b'DEFAULT VALUE', max_length=30)),
                ('password', models.CharField(default=b'DEFAULT VALUE', max_length=128)),
                ('firstname', models.CharField(max_length=30, null=True, blank=True)),
                ('lastname', models.CharField(max_length=30, null=True, blank=True)),
            ],
        ),
        migrations.AddField(
            model_name='groupmember',
            name='gm_member',
            field=models.ManyToManyField(related_name='member_group', to='books.User'),
        ),
        migrations.AddField(
            model_name='group',
            name='g_organiser',
            field=models.ForeignKey(related_name='user_organiser', to='books.User'),
        ),
        migrations.AddField(
            model_name='group',
            name='g_place',
            field=models.ForeignKey(related_name='group_gatherplace', to='books.City'),
        ),
        migrations.AddField(
            model_name='comment',
            name='article',
            field=models.ForeignKey(related_name='article_comment', to='books.Group'),
        ),
        migrations.AddField(
            model_name='comment',
            name='user',
            field=models.ForeignKey(related_name='user_comment', to='books.User'),
        ),
        migrations.AddField(
            model_name='city',
            name='ct_country',
            field=models.ForeignKey(related_name='City_Country', to='books.Country'),
        ),
    ]
