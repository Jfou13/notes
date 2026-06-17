# Working with Files and Directories

## Creating/Moving/Deleting Files & Directories

#### Common Commands Used for File & Folder Management

|**Command**|**Alias**|**Description**|
|---|---|---|
|`Get-Item`|gi|Retrieve an object (could be a file, folder, registry object, etc.)|
|`Get-ChildItem`|ls / dir / gci|Lists out the content of a folder or registry hive.|
|`New-Item`|md / mkdir / ni|Create new objects. ( can be files, folders, symlinks, registry entries, and more)|
|`Set-Item`|si|Modify the property values of an object.|
|`Copy-Item`|copy / cp / ci|Make a duplicate of the item.|
|`Rename-Item`|ren / rni|Changes the object name.|
|`Remove-Item`|rm / del / rmdir|Deletes the object.|
|`Get-Content`|cat / type|Displays the content within a file or object.|
|`Add-Content`|ac|Append content to a file.|
|`Set-Content`|sc|overwrite any content in a file with new data.|
|`Clear-Content`|clc|Clear the content of the files without deleting the file itself.|
|`Compare-Object`|diff / compare|Compare two or more objects against each other. This includes the object itself and the content within.|

## Making Files

```shell
PS C:\htb> PS C:\Users\MTanaka\Documents\SOPs> new-Item "Readme.md" -ItemType File

    Directory: C:\Users\MTanaka\Documents\SOPs

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2022   9:12 AM              0 Readme.md

PS C:\Users\MTanaka\Documents\SOPs> cd '.\Physical Sec\'
PS C:\Users\MTanaka\Documents\SOPs\Physical Sec> ls
PS C:\Users\MTanaka\Documents\SOPs\Physical Sec> new-Item "Physical-Sec-draft.md" -ItemType File

    Directory: C:\Users\MTanaka\Documents\SOPs\Physical Sec

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        11/10/2022   9:14 AM              0 Physical-Sec-draft.md



PS C:\Users\MTanaka\Documents\SOPs> tree /F
Folder PATH listing
Volume serial number is F684-763E
C:.
│   Readme.md
│
├───Cyber Sec
│       Cyber-Sec-draft.md
│
├───Physical Sec
│       Physical-Sec-draft.md
│
└───Training
        Employee-Training-draft.md
```


## Adding Content

```shell
PS C:\htb> Add-Content .\Readme.md "Title: Insert Document Title Here
>> Date: x/x/202x
>> Author: MTanaka
>> Version: 0.1 (Draft)"  
  
PS C:\Users\MTanaka\Documents\SOPs> cat .\Readme.md
Title: Insert Document Title Here
Date: x/x/202x
Author: MTanaka
Version: 0.1 (Draft)
```

## Renaming An Object

```shell
PS C:\Users\MTanaka\Desktop> ls

    Directory: C:\Users\MTanaka\Desktop

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        10/13/2022   1:05 PM              0 file-1.txt
-a----        10/13/2022   1:05 PM              0 file-2.txt
-a----        10/13/2022   1:06 PM              0 file-3.txt
-a----        10/13/2022   1:06 PM              0 file-4.txt
-a----        10/13/2022   1:06 PM              0 file-5.txt

PS C:\Users\MTanaka\Desktop> get-childitem -Path *.txt | rename-item -NewName {$_.name -replace ".txt",".md"}
PS C:\Users\MTanaka\Desktop> ls

    Directory: C:\Users\MTanaka\Desktop

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        10/13/2022   1:05 PM              0 file-1.md
-a----        10/13/2022   1:05 PM              0 file-2.md
-a----        10/13/2022   1:06 PM              0 file-3.md
-a----        10/13/2022   1:06 PM              0 file-4.md
-a----        10/13/2022   1:06 PM              0 file-5.md
```

## coonaitre un alias

```shell
Get-Alias cat

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Alias           cat -> Get-Content

```