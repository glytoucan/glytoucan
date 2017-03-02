---
title: User Preferences
authors:
- Nobuyuki Aoki
date: 2016-01-20
reviewers:
- Kiyoko Kinoshita
layout: paging
categories: [preferences, image format, language]
previous: preferences
next: registration-graphical
last_modified_at: 2017-01-26
---

Profile
------------
  The User Profile displays the information registered with GlyTouCan.  This information is stored in a private triplestore inaccessible from the public.

<br>

![User Preferences](/images/manual/profile-details.png)

<br>

The following are the field names and where they are originated from.
  
**Field - Description**

* Username - The user name used to recognize your account.  Taken from the First name of your linked account.  
* Email - Email address received from your authentication provider.  
* Contributor ID - A hashed key used to identify your account.  
* Verified Email - A flag indicating if your email is verified or not.  
* Generate API Key - A link to randomly generate a hash key.  The current hash key is displayed.  
  
<br>

As described in the bottom half, a link to Sign out is possible.  However to complete this process, it is necessary to access your authentication provider.  
  
For Google, this will be at [accounts.google.com](http://accounts.google.com).

<div id='discourse-comments'></div>

<script type="text/javascript">
  DiscourseEmbed = { discourseUrl: 'http://test.discourse.glytoucan.org/',
                     discourseEmbedUrl: 'http://code.glytoucan.org/manual/profile/' };

  (function() {
    var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
    d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
  })();
</script>
