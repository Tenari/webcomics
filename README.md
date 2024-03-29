webcomics
=========

the more general purpose tool is found in `download-comics.rb`. If you know the dash-name of the comic that [https://comiconlinefree.net/](https://comiconlinefree.net/) uses, (like `star-wars-bounty-hunters`) then you can pull the whole run that they have by doing this:

```
webcomics % mkdir star_wars_bounty_hunters
webcomics % ./download-comics.rb star-wars-bounty-hunters ./star_wars_bounty_hunters/
```


For those who don't want to read the whole story, but do want the webcomic:

1. save "dr_mcninja_get_from_good.rb" and "good_mcninja.txt" to your home directory
2. make a folder at "./Pictures/drmcninja/"
3. run "ruby dr_mcninja_get_from_good.rb" in terminal from your home directory.
4. get all of the images from Dr McNinja saved to your computer.

if you also want all of smbc downloaded:
```bash
git clone [THIS REPO]
cd webcomics
mkdir smbc
./download-smbc.rb
wait as it tries each date
```

--------------------------------------------------------------------------------------------------------------------

I like Dr.McNinja. But I don't have fast internet. I like to read webcomics through, like a book. When I try to do this online, I spend a lot of time waiting. So, I decided to just save all of the images that make up the webcomic to my computer. The following ensued:

I spent some time looking at the site to see how the images were saved.
They are all saved in the /comics/ folder.
They are all titled YYYY-MM-DD-[issue]p[page].[filetype]
So, I enumerated the permutations of the naming (based on different file types)
and then I started iterating from the date of the first webcomic to the end of 2013.
I knew I was going to get a ton of bad urls, so I was logging those in [bad_mcninja.txt](https://github.com/Tenari/webcomics/blob/master/bad_mcninja.txt)

But, then I realized that logging the bad urls is stupid. We only care about the good ones.
so I switched from [dr_mc_ninja.rb](https://github.com/Tenari/webcomics/blob/master/dr_mc_ninja.rb) to [p_2.rb](https://github.com/Tenari/webcomics/blob/master/p_2.rb) and finished creating the list of good urls, which is saved in [good_mcninja.txt.](https://github.com/Tenari/webcomics/blob/master/good_mcninja.txt)

Then I wrote 
    dr_mcninja_get_from_good.rb
for people with the already complete list of good urls to use.

Obviously, there were plenty of iterations and re-tries and bug fixes along the way, but that's the general method I used to do this. I found all the good urls, and then I got all the images.

I did something very similar (and much more efficient) with 
    snow_by_night.rb
another webcomic I like.

Feel free to use, peruse, and make fun of my source. This was just a fun little project I thought I'd share.
