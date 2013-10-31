# This file contains the data created as tests for the dbGenre.destroy_all
User.destroy_all
Wishlist.destroy_all
Bar.destroy_all

u1 = User.create(:name => 'Jade Davis', :email => 'jade0@gmail.com', :image => 'https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-ash4/p206x206/1379382_519501864799896_1109009103_n.png',
                 :password => 'jade', :password_confirmation => 'jade')
u2 = User.create(:name => 'Angie Gove', :email => 'ang.gove@gmail.com', :image => 'https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-ash3/p206x206/734207_10151392905806407_1656555031_n.jpg',
                 :password => 'angie', :password_confirmation => 'angie')
u3 = User.create(:name => 'Brad Swart', :email => 'brad8711@gmail.com', :image => 'https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-prn1/37153_446100081910_4066165_n.jpg',
                 :password => 'brad', :password_confirmation => 'brad')
u4 = User.create(:name => 'AngieAdmin', :email => 'angieadmin@gmail.com', :image => 'https://fbcdn-sphotos-e-a.akamaihd.net/hphotos-ak-ash3/p206x206/734207_10151392905806407_1656555031_n.jpg',
                 :password => 'angieadmin', :password_confirmation => 'angieadmin', :is_admin => 'true')

w1 = Wishlist.create(:title => 'Tis The Season', :description => 'A list of my favourite bars over christmas')
w2 = Wishlist.create(:title => 'Its my party', :description => 'jades 21st birthday bars')

b1 = Bar.create(:name => 'Palmer & Co', :image => 'http://media.au.timeout.com/contentFiles/image/galleries/palmer-and-co/palmer-and-co-018.jpg',
                 :description => '1920 feel underground bar, find me if you can', :email => 'palmerco@gmail.com', :address => '2 Abercrombie lane', :city => 'Sydney',
                 :opening_hours => 'Monday-Thursday - 11:30am - 11pm, Friday-Saturday 3pm - 1am')
b2 = Bar.create(:name => 'Baxter inn', :image => 'http://thebaxterinn.com/img/main_home.png', :description => 'underground wiskey bar with a libary of whiskeys, enjoy an old fashion here!',
                  :email => 'baxter@gmail.com', :address => 'Clarence street', :city => 'Sydney', :opening_hours => 'Monday-Thursday - 11:30am - 11pm, Friday-Saturday 3pm - 1am')
# u1.bars << b2
# u2.bars << b1 << b2

u1.wishlists << w2

w2.bars << b1 << b2

u2.wishlists << w1

w1.bars << b2
