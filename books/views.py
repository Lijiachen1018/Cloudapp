#coding=utf-8
from django.shortcuts import render,render_to_response
from django.http import HttpResponse,HttpResponseRedirect
from django.template import RequestContext
from django import forms
from models import User,Country,City,Group,Comment,GroupMember


class UserFormRe(forms.Form):
    email = forms.EmailField(label='email',max_length=30)
    username = forms.CharField(label='username',max_length=100)
    password = forms.CharField(label='password',widget=forms.PasswordInput())
    firstname = forms.CharField(label='firstname',max_length=30)
    lastname = forms.CharField(label='lastname',max_length=30)

class UserForm(forms.Form):
    username = forms.CharField(label='username',max_length=100)
    password = forms.CharField(label='password',widget=forms.PasswordInput())

#注册
def regist(req):
    if req.method == 'POST':
        uf = UserFormRe(req.POST)
        if uf.is_valid():
            #获得表单数据
            email = uf.cleaned_data['email']
            username = uf.cleaned_data['username']
            password = uf.cleaned_data['password']
            lastname = uf.cleaned_data['lastname']
            firstname = uf.cleaned_data['firstname']
            #添加到数据库
            User.objects.create(username= username,password=password,email=email,firstname=firstname,lastname=lastname)
            return render(req,'groupList.html')
    else:
        uf = UserFormRe()

    return render(req,'regist.html',{'uf':uf})


#登陆
def login(req):
    if req.method == 'POST':
        uf = UserForm(req.POST)
        if uf.is_valid():
            #获取表单用户密码
            username = uf.cleaned_data['username']
            password = uf.cleaned_data['password']
            #获取的表单数据与数据库进行比较
            user = User.objects.filter(username__exact = username,password__exact = password)
            if user:
                #比较成功，跳转index
                response = HttpResponseRedirect('/books/index/')
                #将username写入浏览器cookie,失效时间为3600
                response.set_cookie('username',username,3600)
 # !!!!!!看这里!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                # !!!!!!!!!!!!!!!!!看这里!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!看这里!!!!!!!!!!!!!!!!!!!!!!!!!!
                # !!看这里!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!看这里!!!!!!!!!!!!!!!!!!!!!!!!!!
                # 这里我想让它转到‘我的小组’这个页面，不知道应该用render 还是render_to_response 还是HttpResponseredirect！！！！！
                # 而且要传值
                return render(req,'myGroupDetail_member.html')
            else:
                #比较失败，还在login
                return HttpResponseRedirect('/books/login/')
    else:
        uf = UserForm()
    return render(req,'Login.html',{'uf':uf})


#登陆成功
def index(req):
    username = req.COOKIES.get('username','')
    return render_to_response('index.html', {'username': username})


#退出
def logout(req):
    response = HttpResponse('logout !!')
    #清理cookie里保存username
    response.delete_cookie('username')
    return response


# add comment member
def comment_add(request):

    if request.method == 'POST':

        group_id = request.POST.get('group', '')

        detail = request.POST.get('detail', '')

        if group_id and detail:
            comment = Comment()
            comment.article = Group(id=group_id)
            comment.detail = detail
            comment.save()

        return HttpResponseRedirect('/myGroupDetail_member/%s' % group_id)


# c_a_o
def comment_add_o(request):

    if request.method == 'POST':

        group_id = request.POST.get('group', '')

        detail = request.POST.get('detail', '')

        if group_id and detail:
            comment = Comment()
            comment.article = Group(id=group_id)
            comment.detail = detail
            comment.save()

        return HttpResponseRedirect('/myGroupDetail_organiser/%s' % group_id)


# index
def homepage(request):

    countries = Country.objects.order_by("-id").all()

    return render_to_response('Homepage.html',{'countries': countries})


# 浏览group list  ok
def grouplist(request):

    country = Country.objects.get(id=id)

    groups = Group.objects.filter(Country=id).order_by("-id").all()

    return render_to_response('grouplist.html', {'country': country, 'groups': groups })


# 浏览 my join in group list  not ok
def my_group(request):

    if request.user.is_authenticated():

        current_user = request.user

        gm_id = GroupMember.objects.filter(gm_member=current_user)

        m_groups = Group.objects.filter(GroupMember=gm_id).order_by("-id").all()  # ??/

        return render_to_response('grouplist.html', {'m_groups': m_groups})

    else:
        # login in
        return render_to_response('Login.html')


# 浏览 my organised group list  ok
def myo_group(request):

    if request.user.is_authenticated():

        current_user = request.user

        o_groups = Group.objects.filter(g_organiser=current_user)

        return render_to_response('myGroups.html', {'o_groups': o_groups})

    else:
        # login in
        return render_to_response('Login.html')


# group detail login in or unlogin
def group_detail(request, id):

    group = Group.objects.get(id=id)

    members = GroupMember.objects.filter(Group=id).order_by("-id").all()

    print len(members)

    return render_to_response('group_detail.html', {'group': group, 'members': members})


# group detail login in
def group_detail_member(request, id):

    m_group = Group.objects.get(id=id)

    members = GroupMember.objects.filter(Group=id).order_by("-id").all()

    comments = Comment.objects.filter(Group=id).order_by("-id").all()

    print len(members,comments)

    return render_to_response('group_detail.html', {'m_group': m_group, 'members': members, 'comments':comments})


def group_detail_organiser(request, id):

    o_group = Group.objects.get(id=id)

    members = GroupMember.objects.filter(Group=id).order_by("-id").all()

    comments = Comment.objects.filter(Group=id).order_by("-id").all()

    print len(members,comments)

    return render_to_response('group_detail.html', {'o_group': o_group, 'members': members, 'comments':comments})


# 创建新组  create a new group ok
def create_new_group(request):

    if request.method == 'POST':

        g_name = request.POST.get('g_name',None)
        g_city = request.POST.get('g_city',None)
        g_place = request.POST.get('g_place',None)
        g_member = request.POST.get('g_member', None)
        g_country = request.POST.get('g_country', None)
        g_organiser = request.POST.get('g_organiser', None)
        g_content = request.POST.get('g_content', None)

        new = Group(g_name=g_name,g_city=g_city,g_place=g_place,g_member=g_member,g_country=g_country,g_organiser=g_organiser,g_content=g_content,g_state=0)
        new.save()

        return HttpResponseRedirect('/groupList')

    return render_to_response('create_new_group.html')