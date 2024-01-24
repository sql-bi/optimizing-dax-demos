# optimizing-dax-demos
Demo files for Optimizing DAX book.

The files are divided into two releases:
- [**Demo files**](https://github.com/sql-bi/optimizing-dax-demos/releases/tag/demo-files): DAX code and small PBIX files used for specific chapters and demos. You can download the ZIP file in the release containing all these files organized in one folder for each chapter.
- [**Sample data**](https://github.com/sql-bi/optimizing-dax-demos/releases/tag/sample-data): Common PBIX files and databases used by all the demos in the book. Download the files you need according to the RAM and tools available on your computer. Read more in the following instructions.

## Software prerequisites
You need the following software to practice using the book demos.
If you want to know more about the optional tools, you can find more information in the [Mastering Tabular video course](https://www.sqlbi.com/p/mastering-tabular-video-course/) from [SQLBI](https://www.sqlbi.com).

- [Power BI Desktop](https://powerbi.microsoft.com/downloads/)
- [DAX Studio](https://daxstudio.org)
- [Excel](https://www.microsoft.com/microsoft-365/excel) (optional)
- [SQL Server 2022](https://www.microsoft.com/sql-server/) with [latest cumulative updates](https://www.microsoft.com/en-us/download/details.aspx?id=105013) (optional)
- [SQL Server Analysis Services Tabular](https://learn.microsoft.com/analysis-services/tabular-models/tabular-models-ssas) (optional)
- [SQL Server Management Studio](https://learn.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms) (optional)
- [Tabular Editor 2 or 3](https://www.tabulareditor.com/) (optional)

## Hardware prerequisites
To practice the demos with the largest PBIX demo file (Contoso 100M.pbix, 2GB), you need a computer with **at least 16GB of RAM**. If you do not have enough RAM, you can use the smaller Contoso 10M.pbix, which should run on any computer running Power BI Desktop, even though the metrics obtained can be significantly different from the ones shown in the book.

If you want to create the largest database for Analysis Services (Contoso 100M x 10), we suggest a computer with at least 64GB of RAM. This model is used in a few demos: you do not need to repeat those same demos, as you can see similar effects on smaller models, even though at a different order of magnitude.

## Sample code references
At the beginning of each book chapter, there is a reference to the sample code. This reference is the corresponding section and module of the [Optimizing DAX video course](https://www.sqlbi.com/p/optimizing-dax-video-course/) available on [SQLBI](https://www.sqlbi.com). For example, SAMPLE S02.M03 means that the sample code for the chapter is in the folder starting with "S02.M03" within the Demo folder. Such a reference also corresponds to Section 02 and Module 03 of the video course.

## Download the demo files
The demos are files we use in the book to illustrate how to measure performance and optimize code. You need Power BI Desktop and DAX Studio to repeat the same demos on your PC. For a few demos that require very large databases, you need SQL Server and Analysis Services: if you do not have enough RAM to install those databases, repeat the demos on the smaller Power BI Desktop files.

To practice the concepts learned, we suggest looking for patterns you have seen in each section by repeating the same analyses with the sample demo files provided and then on your models.

All the Contoso sample databases have the same structure; the only difference is their size. For example, Contoso 10K contains around 10,000 orders, while Contoso 1M contains around 1 million orders. Most of the demos run on Contoso 100M, and a few run on a larger or smaller Contoso database: you find the reference to the Contoso version in the comments at the beginning of each DAX demo file.

The **PBIX files** contain the sample database for Power BI Desktop. You do not need to refresh these databases. Still, if you want, you should download the SQL Server backup (.bak files), restore them with the same database name (without the .bak extension) on a local SQL Server database, and create an alias named Demo that points to the SQL Server instance where you restored the bak files. Read the [Creating database aliases on SQL Server 2022](https://www.sqlbi.com/blog/marco/2023/01/08/creating-database-aliases-on-sql-server-2022/) article to create the Demo aliases on both 32-bit and 64-bit configurations of SQL Server.

The **Optimizing DAX - Demo files.ZIP** archive contains all the files used in the demos of the book. Download the file and unzip the content in a local folder on your computer. Most of the demos run on a Contoso sample database; only a limited number of demos have separated PBIX files that you find in the same module folder of the demo files.

The **BAK files** are SQL Server backups you can restore on SQL Server 2019 or 2022 to refresh the PBIX file and/or to populate corresponding Analysis Services databases. Read the [Creating database aliases on SQL Server 2022](https://www.sqlbi.com/blog/marco/2023/01/08/creating-database-aliases-on-sql-server-2022/) article to create the Demo aliases on both 32-bit and 64-bit configurations of SQL Server. The Contoso 100M.bak file is stored in two files, Contoso 100M.7z.001 and Contoso100M.7z.002: you can extract the original Contoso 100M.bak by using the [7-Zip tool](https://www.7-zip.org/).

The **AS BIM - Contoso 100M X 10.ZIP** archive contains the Tabular project (BIM file) to generate the Analysis Services database "Contoso 100M x 10" used with the demos with the largest database. You need a large server with at least 64GB of RAM to process this database. However, you can use the Contoso 100M PBIX file to run the same demos executed on "Contoso 100M x 10" (see the reference database in the comments of the DAX code): you will see similar effects at a smaller order of magnitude.
