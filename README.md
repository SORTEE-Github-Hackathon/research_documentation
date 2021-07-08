## GitHub for research documentation

See the slides [here](https://docs.google.com/presentation/d/1CQNClZyES0My-WFBqobd7KymMu9KLMrVLgvMO72WSPY/edit?usp=sharing)

#### _A quick tutorial written by [Emma Hudgins](mailto:emma.hudgins@carleton.ca), originally for the Bennett Lab @ Carleton_


### 1. Getting set up 
- Make a [Github](https://github.com) account
- Download the [Github Desktop App](https://desktop.github.com)
- Create an [OSF](https://osf.io) account
- Create a [Research Data Management Plan](https://assistant.portagenetwork.ca) for your project

### 2. Using GitHub desktop 
- In the left pane, select **Add** to create a new repository
- Choose **Create new repository** and give the path to the project folder (or create a new folder). The folder can be in your Dropbox/OneDrive etc. for extra backup
- A **Git** pane should now appear in the top right of newer versions of RStudio when you're working in the associated R Project (see 3.4 for more on Git), but you can also set a default text editor (I like [**Sublime**](https://www.sublimetext.com))


#### 3. Linking GitHub with OSF

* Create a new OSF project (link)(image) or use a template (My lab has started following this basic template (image)
* add your RDMP to the RDMP section of the OSF project
* Add GitHub as an Add-on in your OSF profile in **Settings>>Configure add-on accounts**
* Link GitHub with your OSF account in the **Add-ons** section of the relevant project components (e.g. Analysis)
    - Select **Import Account from Profile**
    - Select the corresponding repo for the project

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
    - Link the project with a platform that can provide a persistent link to the published version of the data (e.g. Zenodo link with GitHub, Dryad) in order to ensure the published results can be reproduced even as the workflow evolves (add Zenodo example)

* Naming:
https://help.osf.io/hc/en-us/articles/360019931113-File-naming
- Consider adopting a standard file naming convention, i.e. using dashes or underscores to separate name components (avoiding special characters and spaces, especially)
- Use the most informative naming as possible within all project components (including variable names in code).
- Number or date scripts so that they order themselves meaningfully (i.e. by order of use or version number)

#### Appendix 1. Connecting to a remote server via SSH


* Open terminal (```Ctrl+Alt+T``` on Ubuntu, ```Command+Space``` on Mac to bring up **Spotlight** and search for ```Terminal```, or use the Windows Start menu and look for **Windows Powershell** or **Command Prompt**)
* Type ```ssh user@hostname``` for the remote machine you want to connect to
```console
EmmaH:~/$ ssh ehudgins@nature-vm04.carleton.ca
```
* Enter your password when prompted, (be prepared to say _Yes_ to yet another message about a fingerprint)
* Navigate to the directory where your script is stored (maybe you transfered it there with FileZilla?) using [*cd*](https://linuxize.com/post/linux-cd-command/)


#### Appendix 2. Configuring git on a remote machine

* If you want to sync an existing GitHub repository, use git in the terminal (see 3.4, and [see here for more info](http://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/git.html) on working with git in various ways 

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

