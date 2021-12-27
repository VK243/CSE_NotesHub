    DATABASES = {  
        'default': {  
            'ENGINE': 'django.db.backends.mysql',  
            'NAME': 'enotes_db',  
            'USER': 'root',  
            'PASSWORD': 'my$ql@root@987',  
            'HOST': '127.0.0.1',  
            'PORT': '3306',  
            'OPTIONS': {  
                'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"  
            }  
        }  
    }  