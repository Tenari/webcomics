webcomics
=========
For those who don't want to read the whole story, but do want the webcomic:
1. save "dr_mcninja_get_from_good.rb" and "good_mcninja.txt" to your home directory
2. make a folder at "./Pictures/drmcninja/"
3. run "ruby dr_mcninja_get_from_good.rb" in terminal from your home directory.
4. get all of the images from Dr McNinja saved to your computer.
--------------------------------------------------------------------------------------------------------------------

I like Dr.McNinja. But I don't have fast internet. I like to read webcomics through, like a book. When I try to do this online, I spend a lot of time waiting. So, I decided to just save all of the images that make up the webcomic to my computer. The following ensued:

I spent some time looking at the site to see how the images were saved.
They are all saved in the /comics/ folder.
They are all titled YYYY-MM-DD-[issue]p[page].[filetype]
So, I enumerated the permutations of the naming (based on different file types)
and then I started iterating from the date of the first webcomic to the end of 2013.
I knew I was going to get a ton of bad urls, so I was logging those in bad_mcninja.txt

But, then I realized that logging the bad urls is stupid. We only care about the good ones.
so I switched from dr_mc_ninja.rb to p_2.rb and finished creating the list of good urls, which is saved in good_mcninja.txt.

Then I wrote dr_mcninja_get_from_good.rb, for people with the already complete list of good urls to use.

Obviously, there were plenty of iterations and re-tries and bug fixes along the way, but that's the general method I used to do this. I found all the good urls, and then I got all the images.

I did something very similar (and much more efficient) with snow_by_night, another webcomic I like.

Feel free to use, peruse, and make fun of my source. This was just a fun little project I thought I'd share.
