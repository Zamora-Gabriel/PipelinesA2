---------------------------------------
<Gabriel Zamora>
<28/07/2021>

The project is a batch file that after execution lets the user generate automatically a build of the actual state of the unity project on github.

The goal of this assignment is to create a tool to make automatic builds of the final project.

[demo] (https://github.com/Zamora-Gabriel/PipelinesA2.git) | (link)


## Synopsis
---------------
In this project, students were tasked with writting a batch file thatafter executions automates Unity's or Unreal's project building and saves each build by day for at least
three iterations. Also, the batch file needs to clone from github the repository of the project in order to generate the latest build.

# Download/Install
---------------------------------------

Browse to demo link and download the zip or download it from:

[Download Zip](https://github.com/Zamora-Gabriel/PipelinesA2/archive/refs/heads/master.zip)

- Once downloaded Uncompress the zip to a folder

- Since git is required, if it was not installed previously install git in the command line by browsing and following the installing directions inside the next link 
"https://www.atlassian.com/es/git/tutorials/install-git"

# *** How to use ***
---------------------------------------

- After the download/install steps, the user can simply click on the build_it.cmd file in windows in order to execute the batch file

- The commands will be executed automatically and a folder with the project's name will be generated or updated

- If it is the first time or the project hasn't been started with unity yet, the batch file will take some time to generate the build

- After the Build was generated, go inside the "Release" folder which is inside of the folder where the cmd file was executed. There should be the Build.exe which
corresponds to the executable file.

- The Builds folder will contain three folders being "today" the latest build, "yesterday" the previous one, and "oldest" the first one. Note that it only 
saves the three last builds since older builds could not be required.

- In any case an error had ocurred during the process, on the Logs folder there will be two files a logs.txt file containing all of the process for the build generation
and an errlog.txt file which has filtered the Exceptions that unity may have thrown trying to generate the build.