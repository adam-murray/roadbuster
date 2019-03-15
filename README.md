*********************
Roadbuster
*********************

Overview
============
A lightweight django project with helper management commands to speed up djangocms development/test workflow (especially django_moderation). It can be considered an integration testing environment.

Extras
---------
1) settings.py has all the necessary setups in INSTALLED_APP
2) django-su is installed, allowing us to switch easily between admin users


Prerequisites
============
Elastic search needs to be installed. Visit http://127.0.0.1:9200/ to confirm it is installed and configured correctly.


Installation & Setup
============

This assumes you have a python virtual environment setup with djangocms installed. If not run:

```bash
    mkvirtualenv roadbuster
    pip install -r dev_requirements.txt
```

For people on the FIL network with SSH blocked use:

```bash
    pip install -r http_dev_requirements.txt
```


Then, pip install the plugin/application under test/development (e.g django_moderation) using ```pip -e <path_to_plugin>```


Usage
==========

1) To reset you database and re-populate it with CMS Pages and Moderation Workflows run the management command:

```
    python manage.py reload_db
```

2) To drop the DB and refresh it to a brand new blank database. The reload_db command will also need to be ran manually.
```
    python manage.py drop_db
```

3) One way to use roadbuster with a package you're currently working on is:
   ```
       pip uninstall <package_name>
       python path/to/package/setup.py develop
   ```
   And then when you're done:
   ```
      python path/to/package/setup.py develop --uninstall
      pip install -r dev_requirements.txt
   ```
   Again if you are being blocked on SSH use:

   ```bash
    pip install -r http_dev_requirements.txt
   ```

4) The default datasets that will be run can be changed using app settings. The `reload_db` command runs the djangocms-fil-bootstrap add-on as a CLI command. This can be configured to run various data sets as required. By default it runs all datasets available in bootstrap. The list of datasets to run can be altered using settings. E.g. 

  ```
    BOOTSTRAP_DATASETS = [
      'roles',
      'demo'
    ]
  ```

These datasets must exist in the `djangocms-fil-bootstrap/djangocms_fil_bootstrap/builtin_data` folder. 


Contribution
=============

Please add more management commands as you see fit.
