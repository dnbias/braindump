[![Netlify Status](https://api.netlify.com/api/v1/badges/d6b49afd-cd07-4714-87d1-bc8e8239068f/deploy-status)](https://app.netlify.com/sites/dnbias-brain/deploys)
# Daniel's Braindump

You've somehow found my brain, welcome.

This is a Zettelkasten generated via Emacs [ox-hugo][ox-hugo] and uses my branch the [cortex][cortex] theme by [Jethro Kuan](https://github.com/jethrokuan/), to whom goes credits for the process here described.

I write everything in Emacs [org-mode][org] and then convert everything through the [Ninja](https://ninja-build.org/ "Ninja") build tool. 

To convert all Org files into Markdown, run:

```bash
./build.py
```

After that run [hugo][hugo] to generate the files (find them in `/public`):

    $ hugo

Or run the following to get an immediately browsable website on localhost:

    $ hugo serve

[hugo]: https://gohugo.io/
[ox-hugo]: https://github.com/kaushalmodi/ox-hugo
[cortex]: https://github.com/jethrokuan/cortex
[org]: https://github.com/jethrokuan/braindump/tree/master/org
