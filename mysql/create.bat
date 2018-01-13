@ECHO OFF
    @set input1=
    @set /p input1=please input password:
    :begin
        mysql -uroot -p%input1% < create_table.sql
        mysql -uroot -p%input1% < create_user.sql
        mysql -uroot -p%input1% < create_view.sql
        mysql -uroot -p%input1% < create_trigger.sql
    @echo MySql init done
    :end