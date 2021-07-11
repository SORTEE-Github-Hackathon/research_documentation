# GitHub for research documentation

## See the slides [here](https://docs.google.com/presentation/d/1CQNClZyES0My-WFBqobd7KymMu9KLMrVLgvMO72WSPY/edit?usp=sharing)
[![hackmd-github-sync-badge](https://hackmd.io/N9ISkOp3QraJ_sVEiZdU4Q/badge)](https://hackmd.io/N9ISkOp3QraJ_sVEiZdU4Q)


#### _A quick tutorial written by [Emma Hudgins](mailto:emma.hudgins@carleton.ca), originally for the Bennett Lab @ Carleton_


### 1. Getting set up 
- Make a [Github](https://github.com) account
- Download the [Github Desktop App](https://desktop.github.com)
- (optional) Create an [OSF](https://osf.io) account
- (optional) Create a [Research Data Management Plan](https://assistant.portagenetwork.ca) for your project

### 2. Using GitHub desktop 

####2.1 creating a repo
- In the left pane, select **Add** to create a new repository
- Choose **Create new repository** and give the path to a new project folder (or fork this one via **Clone**, or add an existing folder). <img src="/screenshots/create_repo.png" alt="github desktop create repo" width="400">
- I keep all my repos in my _OneDrive_.<sup>1</sup> in a folder called **Github**<img src="/screenshots/github_folder.png" alt="github folder screenshot" width="600">
- Choose a License that reflects the reuse conditions you'd like for your project (see [here](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/licensing-a-repository) for a description of licenses available)
- Initialize the repo with a **README** that you will fill following the **Metadata** tips in section 4. to ensure reproducibility
- If necessary, change the [privacy settings](https://docs.github.com/en/github/administering-a-repository/managing-repository-settings/setting-repository-visibility) of your repo on the Github website (storage limits are lower for private repositories).

####2.2 your first commit
- You can manually open your files as usual, but you can also use the **Repository** tab to open your files all at once in a text editor (I set my default to [**Sublime**](https://www.sublimetext.com))
- Try make a small change to one of your files, or create a new file.
- If you navigate back to Github desktop, there should be evidence of a changed/new file <img src="/screenshots/commit.png" alt="github folder screenshot" width="800">
- If you're satisfied with your changes, type a commit message (or use the default for a single file change) and press **Commit**
- Send your changes to Github's server by pressing **Push to origin**  <img src="/screenshots/push.png" alt="github push screenshot" width="400">
- Your changes will be reflected on the online version of your repo.
- Now, try changing a file on the online repo (e.g. using the pencil icon to update the README) and **Pull**ing the changes to your local computer
- A **Git** pane should now appear in the top right of newer versions of RStudio when you're working in the associated R Project.

<sub>1. Some people say not to do this because it causes OneDrive to constantly sync small Github files, but it doesn't seem to cause me any trouble, and it helps me avoid accidentally deleting things when I make mistakes with  GitHub Desktop. [see here for at least one other person who does this](https://medium.com/@awlucattini_60867/i-backup-my-cloned-github-repositories-on-onedrive-54b176192950)</sub> 

#### 3. Linking GitHub with OSF

* Create a new OSF project <br> <img src="/screenshots/osf_proj.png" alt="OSF project screenshot" width="400">
* Or use a template (_My lab has started following this basic template_) <img src="/screenshots/proj_template.png" alt="OSF project screenshot" width="800">
* Use a program like [DMP Assistant](https://assistant.portagenetwork.ca) to add a Research Data Management Plan to the RDMP section of the OSF project
* Add GitHub as an Add-on in your OSF profile in **Settings>> Select add-ons** <img src="/screenshots/osf_github.png" alt="OSF github integration screenshot" width="800"><img src="/screenshots/import_acct.png" alt="OSF import account screenshot" width="800">
* Link GitHub with your OSF account in the **Add-ons** section of the relevant project components (e.g. Analysis)
    - Select **Import Account from Profile** <img src="/screenshots/import_acct.png" alt="OSF import account screenshot" width="800">
    - Select the corresponding repo for the project <img src="/screenshots/select_repo.png" alt="OSF select repo screenshot" width="800">

#### 4. Some reproducibility tips (large taken from the Bennett Lab manual compiled by Jaimie Vincent)

* Data management and storage
    - Starting any research project with an RDMP provides direction for conducting research in line with Open Science/FAIR practices.
    - Data and code should be backed up regularly, using the “3-2-1” rule as a rule of thumb - this means having three copies of your data (your working copy and two backups) on two different formats (e.g., cloud storage and disk storage) with at least 1 off-site copy for disaster recovery. 
    - Update your RDMP as necessary to include information about where these files will be permanently stored in addition to your storage, backup, security and archiving protocols. 
    - Your code and/or analyses, interpreted data, and other outputs (e.g., figures, tables) should be continuously backed up and securely stored. Be sure to consider data privacy when making backups.
    - Store data and code in an organized file system (for instance, using a breakdown of scripts, raw data, derived data , outputs within a large project directory)
    - Do not alter the raw data (consider making it read-only) to have a stable separate copy

* Intellectual property
    - This is particularly important to discuss when the work belongs to students whose association with a particular research group may be temporary.
The RDMP can help transparency around whose intellectual property this work represents. It can be useful to name a single data steward who is responsible for the maintenance of the code and data throughout its lifecycle

* Metadata
    - There should be adequate metadata documentation. Metadata provides information about code and data function and usage, and often takes the form of ‘README’ files in research projects. GitHub Desktop asks if you want to initialize a README file whenever you create a new repo
    - Consider having a single readme at the minimum for the project that outlines all scripts and input data files and how they interact such that the analyses can be reproduced. 
    - At the minimum, this file should contain the project Title, Authors, Description - including of all folder subdirectories and how they relate to each other, Date, and License. GitHub allows easy association of a variety of license types with repositories - consider a license like GPL or CC-BY to ensure allowability of the reuse of your code
    - Cryptic naming conventions in data files should be described, as well as any units and geographic transformations. 
    - If the project includes external data sources, download dates should be provided as well as any relevant filters selected.
    - Update the metadata following any changes to the workflow

* Code
    - Provide software and package version information in either the metadata or in a commented header section of any script
    - Provide annotated code with comments describing all steps taken in the analysis
    - All figures and tables should be entirely reproducible with the code and data provided (data privacy restrictions permitting). For sensitive data, plan for appropriate anonymization and secure storage
    - Consider using packages that guess working directories (e.g. here package for R), or using project files like .Rproj to facilitate data and code integration when the data and code are shared

* Hosting
    - Link the project with a platform that can provide a persistent link to the published version of the data (e.g. Zenodo link with GitHub, Dryad) in order to ensure the published results can be reproduced even as the workflow evolves. [See here for how to create a Release and link with Zenodo](https://guides.github.com/activities/citable-code/)

* Naming ([OSF naming guidelines](https://help.osf.io/hc/en-us/articles/360019931113-File-naming))
    - Consider adopting a standard file naming convention, i.e. using dashes or underscores to separate name components (avoiding special characters and spaces, especially)
    - Use the most informative naming as possible within all project components (including variable names in code).
    - Number or date scripts so that they order themselves meaningfully (i.e. by order of use or version number)

#### Appendix 1. Connecting to a remote server via SSH (in case you want to sync your GitHub repo with a server for backup or computing power)


* Open terminal (```Ctrl+Alt+T``` on Ubuntu, ```Command+Space``` on Mac to bring up **Spotlight** and search for ```Terminal```, or use the Windows Start menu and look for **Windows Powershell** or **Command Prompt**)
* Type ```ssh user@hostname``` for the remote machine you want to connect to
```console
EmmaH:~/$ ssh ehudgins@nature-vm04.carleton.ca
```
* Enter your password when prompted, (be prepared to say _Yes_ to yet another message about a fingerprint)
* Navigate to the directory where your script is stored (maybe you transfered it there with FileZilla?) using [*cd*](https://linuxize.com/post/linux-cd-command/)


#### Appendix 2. Configuring git on a remote machine (this section also shows you how to embed code chunks in Markdown)

* If you want to sync an existing GitHub repository, use git in the terminal ([see here for more info](http://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/git.html) on working with git in various ways)

* To clone a GitHub repo to a remote machine, install *git*
    - in the terminal (for Ubuntu), type
    ```console
    ehudgins@nature-vm04:~/$ sudo apt install git
    ```
    - [see here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for other OS instructions
    - Configure git for your GitHub account
    ```console
    ehudgins@nature-vm04:~/$ git config --global user.email "you@example.com"
    ehudgins@nature-vm04:~/$ git config --global user.name "Your Name"
    ```
* Clone using 
```console     
ehudgins@nature-vm04:~/$ git clone https://github.com/emmajhudgins/example_github_osf
```
* If you update the repo on your local computer, pull from the folder
```console     
ehudgins@nature-vm04:~/example_github_osf$ git pull 
``` 
* If you update the repo on this remote machine, commit changes and push to origin
```console     
ehudgins@nature-vm04:~/example_github_osf$ git add <changed file>
ehudgins@nature-vm04:~/example_github_osf$ git commit -m "<message>"
ehudgins@nature-vm04:~/example_github_osf$ git push
```   

