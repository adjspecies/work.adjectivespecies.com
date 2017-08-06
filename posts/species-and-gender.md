---
layout: default
title: Species, Gender, and Data
---

One of the neat things about identity is the fact that a **shared** identity can lead to a community.

This is the way furry works, after all. A bunch of folks all around the world started identifying with this thing. Maybe they identify as folks who see themselves as something other than human. Or maybe they identify as someone who really likes art of anthropomorphic animals. There's a lot of different ways to approach the topic of anthropomorphics.

Getting a bunch of folks together with a shared identity takes a lot of organization. That is, unless you've got the internet.

Suddenly, we start to see a community cohere out of shared identity. It's a strange attractor of sorts: folks who are outside furry but share that identity are drawn in, making the sense of community more appealing to those outside, yet still have the shared identity.

Similar things happen within the LGBT community. Parties, gay clubs, and pride parades are some of the most visible aspects of this, of course. Still, much the same happens with trans folk. There are whole houses and communities of trans people in the embodied world, and online, the community becomes even grander. We talk of the gender cascade or the transplosion, the idea of "the act of seeing in others that portion of identity we find within ourselves that lends the greatest validation to our membership". Seeing others live happily with their identity embraced makes it easier to embrace our own identity.

Now, come with me on a short diversion through furry fiction.

Short fiction anthologies come and go within the fandom. There's a schedule of regular ones, and some that are just one-offs. There's *HEAT* and *ROAR* and *FANG* for some of the regular ones, and then there's *Dogs of War* and *Seven Deadly Sins* and, shameless plug, *Arcana* for some of the one-offs.

They all work in fairly similar ways, too. A call for submissions will go up, say, six months ahead of time with a list of requirements --- genre, rating, word count, etc. --- which will give authors a chance to write or polish a story to submit. In reality, of course, that means that many authors will spend five and a half months talking about the anthology, then two scrambled weeks of intense effort pulling something together. We're pretty predictable like that.

To drag us slowly back on topic, one of those recent calls was for an anthology of lesbian erotica. There has been an awful lot of erotica written and published, and the vast majority of it has been gay or straight (and I'd hazard a guess that a lot of that has been gay). That would make CLAW, this anthology, the first of its kind.

The reasons for this are manifold and almost certainly not well understood.

Some of them have come up here, of course. JM wrote a few articles on gay furries and why the fandom may look appealing to them. My stock response is a hypothesis that, given the relatively even distribution furries along a scale from heterosexual to homosexual[^scale], along with the overwhelming majority of furries identifying as male, a majority of homosexual relationships within the subculture is to be expected. If you're a bi male fox, you're more likely to wind up in a gay relationship by virtue of your dating pool being 80%[^ratio] male.

Things like that make CLAW's position as the first lesbian anthology a bit easier to understand, at least.

*Come on Makyo, get to the point...*

So! I decided to write for CLAW. I don't write much fiction. I've got one story published in the FC2016 con book, one story to be published in *Arcana*, and...that's it. I thought it'd be fun to give this a go. The stakes were low, the restrictions loose, and the story was fun to write.

One problem: I wanted to write a trans character into the story.

I talked with Kirisis, the editor of the anthology, and she confirmed that it would be alright, so I went ahead with my plan. The character's species was chosen out of necessity to the plot, and I didn't really give it a second thought.

At least, not until I finished the story and thought it might be fun to write another. *I know,* I thought. *I'll write the trans character's backstory! I'll write her struggles with coming out.*

I dropped that idea almost immediately. To write that story, I would have to go back further in the character's past than I really wanted. I'd have to provide her deadname. I didn't know that name. I didn't **want** to know that name. I was too attached to her as a person, real or not, to want to disrespect her that way.

*Okaaaay, well, I'll write a different fur's story!*

And now, eight hundred words later, we come to our topic.

*Well, that's easy. I can just find another character's voice, pick a species, and go!* It all seemed so straight-forward!

Leave it to me to over-think things.

Part of the success of Kyell Gold is that the characters he writes mirror some very basic things about large enough swaths of the fandom as to give them immediate social currency. Coming out stories, the *bildungsroman* genre[^pun], even the species choices, they all speak to the reader in ways that provide a sense of shared identity.

Dev the tiger and Lee the fox, Sol the wolf, Kory the otter: they're all relatable characters. The names are familiar, but more importantly, so are the species. The species all occur within the top ten most popular species in the fandom. They're all species we know.

Gold is a far, far better writer than I am, and I'm constantly learning from him, both passively and actively.

So I figured I'd give this a go: if I'm going to write a trans coming out story, I want to pick a character in which the readers can see something of themselves.

I decided to go on a dive through some of the data and see what might make this work. Using the 2016 Furry Poll, we have data for both species and gender alignment (that is, trans- or cisgender). I usually just dump numbers in a post, but I thought it might be an interesting exercise to go through my actual process in getting those numbers.

The first thing we need to do is to loop through all of the responses we have in the database. This whole exercise takes the form of a python script; it's not very efficient, but does show the steps required.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=fetch_from_db.py"></script>

In this snippet, we loop through all of the responses in the dataset. For each response, we grab the fields we need: gender alignment, species, and just because, gender identity.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=format_data.py"></script>

From there, we need to take the data we've collected and boil it down to some key statistics. This mostly involves tallyingup numbers. For instance, we can find the number of cis and non-cis respondents, as well as the number of masculine and feminine respondents, including breaking those down into cis-masculine/feminine and non-cis-masculine/feminine respondents.

The species bit is a little more complicated, however. If we haven't seen a response of that species before, we have to add one to our set of species responses. We do this by adding a dict --- that is, a list of keys and values (much like a dictionary, where there's the word to be defined and the definition of the word) --- with the name of the species associated with some data. In this case, that data is how many respondents of that species are cis or non-cis.

For the purpose of this exercise, we're relying on the 'species category' field of the survey. These are general categories such as "wolves" or "cats", rather than specifics such as "maned wolves" or "panthers".

Another thing to note is that, for the gender identity and alignment fields, respondents were allowed to enter their own answers, rather than pick from the list of available answers. If they did so, we mark their answer to that question as **subjective**, rather than objective. If they did so, we don't save that data.

All data in the database is anonymous, but the subjective responses could be identifying information. **All** of the data published by [a][s] is stripped of subjective responses. The datasets with the subjective data are limited to researchers only.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=print_starting_data.py"></script>

From there, we can start printing information about our results. In order to get an overall idea of things, we begin by printing a breakdown, by gender, of cisgender respondents, non-cisgender respondents, and respondents who answered "it's complicated".

The term "non-cisgender" is important, as, in this instance, we're using it as a blanket category to include transgender, genderqueer, genderfluid, agender or neutrois, or other folks who don't fall under the umbrella of cisgender.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=sort_species.py"></script>

Now that we've printed some of our basics, let's sort our species data. We want to find the species category which contains the greatest number of cisgender respondents, as well as the one with the least. This is as easy as looping through the responses and finding the one with the most and least.

To do this, we start with some empty variables. For the most non-cis species category, we start with 0%. We loop through the data and calculate the percentage of non-cisgender respondents for that species. If that percentage is greater than the current one (and anything's greater than our starting value of 0%), we update the variable to point to that species. If a future one is greater, we update; if not, we skip.

The same takes place with the least non-cis (or most cisgender) species, except that we start with 100% non-cis, and check if the species we're investigating is less than 100% non-cis.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=print_species_data.py"></script>

Almost done! Next, we print out all of our findings. For both most and least non-cis, we print out the percentage and number of respondents.

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=print_n.py"></script>

Last step: print out the number of responses we looked at, and the number of responses with species categories.

Alright, exercise over! Let's get to the results!

<script src="https://gist.github.com/makyo/13c9fab975f671a4845b6ce6c0eeaba7.js?file=results.txt"></script>

Wow, uh...okay. Not quite what I was expecting!

First of all, what's `otherdog`?

Not much, what's other with you, dog?

Sorry.

`otherdog` is any dog not specifically named. We have a few that are, of course. Husky, German Shepherd Dog, and collie to be precise. `otherdog` is the catch-all category for breeds that don't fall into any of the specified categories.

But what's going on here?

The least cisgender --- that is, most cisgender --- species is husky. Other dogs are the least cisgender. And this is out of all species categories, of which there are 67.

Huh!

Now, let's go back through that and tick all our boxes that make this result true.

* We are looking at only species with more than 100 responses. If we drop our threshold to 50, then we wind up with kitsunes as the least cisgender species, at 34%. Perhaps this makes sense, though, for a species known for its shapeshifting and magical abilities.
* We are looking only at species categories, not individual species. This means that there is likely some further variation to be had digging down a little further, but that involves coding subjective responses, and I don't really have the time or energy for that. Additionally, there are doubtless species that aren't represented here (as is shown by the `other` category).
* We're discarding polymorphic respondents, as each would be its own species. If we allow for polymorphic respondents, polymorphic respondents are the least cis, and respondents who are at least part red fox are the most cis. The data gets muddy.
* We are looking at the 2016 survey, which only gives us so much data, about 5,400 responses, only about 4,800 of which have species categories set.

And how we're here, with huskies being the most cisgender species, and other dogs being the least.

My original quest was to write a trans coming-out story that would find appeal within the fandom. One where many readers would find a bit of themselves in the main character, a character who was relatable. A lot of that's on me, writing an engaging character that mirrors others' experiences, but some of that is just in knowing one's audience, and this is just one fact I can keep in mind.

There's a lot that goes into species selection, just as there's a lot that goes into gender. We make these choices about how we represent ourselves within the fandom carefully, even if it feels instinctive. Each aspect of our characters is representative of some aspect of ourselves. Our hopes and wishes, dreams and aspirations. Things we admire about ourselves are magnified and things that we despise about ourselves are reduced. We become the animal people we want to see in the world.
