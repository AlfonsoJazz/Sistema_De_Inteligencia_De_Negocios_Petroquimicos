# Sistema_De_Inteligencia_De_Negocios_Petroquimicos

Sistema de inteligencia de negocios para la captura de productos petroleoquímicos y derivados del gas.

Desarrollado con el uso del Framework .Net 4.0, Visual Studio 2010, Visual Basic .Net y SQL Server 2008.

Este sitio web tiene como objetivo agilizar el proceso de captura de los datos brindados sobre el comportamiento del mercado de los diferentes productos petroquímicos y derivados del gas en sus diferentes regiones y según sus categorías para su procesamiento final y posteriormente ser presentados con gráficos en Tableu. 

El Acceso es a través del usuario de red del dominio de Windows.
![Login por medio de usuarios del dominio de Windows](/zSINO_captures/SINO-Account-Login-aspx.png "Login por medio de Usuarios del dominio de red de Windows")

La captura de datos se realiza mediante formularios especificamente diseñados para cada tabla de la base de datos y funciona de manera inteligente realizando calculos de totales y ajustes según densidades y / o unidades de medida por medio de procedimientos almacenados.
![Formularios de captura](/zSINO_captures/SINO-Gas_Natural_Comp-aspx.png "Formularios ajustados a la tabla correspondiente en la base de datos")

El sistema solo permite la extracción del último registro de la tabla para su corrección, esto con el fin de evitar incoherencias en los datos ya capturados.
![Formularios de captura Edicion](/zSINO_captures/SINO-Gas_Natural_Comp-aspx-2.png "Edicion del ultimo registro en la tabla")
