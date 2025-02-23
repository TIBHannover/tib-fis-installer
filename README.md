#VIVO project template
This is a git repository template for working with and customizing [VIVO](http://vivoweb.org/).  It uses the [three tiered build approach](https://wiki.duraspace.org/display/VIVO/Building+VIVO+in+3+tiers) documented by the VIVO project.  The project source files (VIVO and Vitro) are tracked using [Git Submodules](http://git-scm.com/book/en/Git-Tools-Submodules).

For a more detailed explanation of setting up the VIVO environment, consult the
[VIVO version 1.8 installation
instructions](https://wiki.duraspace.org/display/VIVO/Installing+VIVO+release+1.8).

As of December 2015, the project's develop branch using [Maven](https://maven.apache.org/) for its build tool. Follow the directions below for building your custom VIVO project with Maven. 

##Checking out the project and building VIVO in three tiers

### Develop branch
~~~

    git clone https://github.com/lawlesst/vivo-project-template.git vivo
    cd vivo
    git submodule init

#Pull in VIVO and Vitro.  This will take a few minutes.

    git submodule update

#Check out specific versions of VIVO and Vitro

    cd VIVO
    git checkout develop
    cd ../Vitro
    git checkout develop

#Change back to vivo main directory

    cd ../VIVO

# Copy default-settings.xml

cp custom-vivo/default-settings.xml custom-vivo/custom-settings.xml

#Using a text editor, change the settings for the VIVO home directory, Tomcat location, and theme to match your environment. 

#Build and deploy

mvn install -s custom-vivo/custom-settings.xml

~~~

###VIVO 1.8
~~~

    git clone https://github.com/lawlesst/vivo-project-template.git vivo
    cd vivo
    git submodule init

#Pull in VIVO and Vitro.  This will take a few minutes.

    git submodule update

#Check out specific versions of VIVO and Vitro

    cd VIVO
    git checkout maint-rel-1.8
    cd ../Vitro
    git checkout maint-rel-1.8

#Change back to vivo main directory

    cd ..

#Copy default build.properties, runtime.properties, and applicationSetup.n3

    cp example.build.properties build.properties
    cp example.runtime.properties runtime.properties
    cp config/example.applicationSetup.n3 config/applicationSetup.n3

#Adjust build, runtime, and applicationSetup properties
#Create the vivo data directory specified in build.properties if it doesn't exist. Eg:

    mkdir -p /usr/local/vivo/data/config
    cp runtime.properties /usr/local/vivo/data
    cp config/applicationSetup.n3 /usr/local/vivo/data/config

#Build and deploy VIVO

    ant all

~~~

###VIVO 1.7
This project template makes it easy to switch between versions of VIVO. To build version 1.7, follow these steps. 

~~~
$ git clone https://github.com/lawlesst/vivo-project-template.git vivo
$ cd vivo
$ git submodule init
#Pull in VIVO and Vitro.  This will take a few minutes.
$ git submodule update
#Check out specific versions of VIVO and Vitro
$cd VIVO
$git checkout maint-rel-1.7
$cd ../Vitro
$git checkout maint-rel-1.7
#Change back to vivo main directory
$cd ..
#Copy default deploy.properties and edit
$cp default.build.properties build.properties
$cp default.runtime.properties runtime.properties
#Adjust build and runtime properties
#Create the data directory specified in build.properties if it doesn't exist.
#E.g. $mkdir -p /usr/local/vivo/data
$cp runtime.properties /usr/local/vivo/data
#Build and deploy VIVO
$ ant all
~~~

##Benefits to this approach
 * local changes are separated from core code making upgrades easier.
 * using Git you can checkout any tagged release, build it with your local changes, and test it out.
 * using the steps above, you can quickly deploy VIVO to another machine.
 * you can use Git features, like [cherry-pick](http://www.vogella.com/articles/Git/article.html#cherrypick), to select bug fixes or enhancements that are not yet in a VIVO release and incorporate them into your implementation.
 * even if you plan on making few modifications, this can be a convenient and efficient way to manage your custom theme.

##Questions or comments
[Open an issue](https://github.com/lawlesst/vivo-project-template/issues) via the issue tracker.

test
