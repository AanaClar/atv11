## **Atividade 11**

**Objetivo:** carregar um ambiente completo em código para execução da aplicação **[todolist][1]** no ambiente ***AWS Academy***\. Obrigatoriamente deve ser usado um banco de dados ***PostgreSQL*** separado, seja instalado em uma instância ***EC2*** ou no serviço ***RDS***\.

**Etapas:**

1. Configurar uma pasta com arquivos do Terraform para criar uma instância EC2 para executar a aplicação e outra instância(EC2 ou RDS) para executar o banco de dados
2. Configurar uma pasta com arquivos Ansible para as seguintes configurações:
   1. No caso de usar o EC2 para o banco de dados, configurar o PostgreSQL na instância de banco de dados.
   2. Instalar o Docker na instância de aplicação, baixar o código da aplicação do **[GitHub][1]** e subir a aplicação, tornando-a acessível pelo IP público da instância.

[1]: <https://github.com/joaomarceloalencar/devops/tree/main/Laboratorios/02_Docker "todolist">
