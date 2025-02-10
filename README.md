# TOOLS
Maybe useful


## Makefile

Squelette d'un makefile pour un projet en C++ avec gestion des fichiers objets ainsi que des dépendances.

## Commande Utile

Checker les leaks sans devoir mettre `system("leaks leprogramme")`
```
leaks --atExit -- ./leprogramme
```


## Compiler avec le flag C++98

Rajouter `-pedantic` -> `-pedantic -std=c++98`

### Ignorer les leaks de readline + fork
    
```
{
    ignore_readline_leaks
    Memcheck:Leak
    ...
    fun:readline
}
{
    ignore_rl_history_leaks
    Memcheck:Leak
    ...
    fun:add_history
}
{
    ignore_forks_leaks
    Memcheck:Leak
    ...
    fun:fork
}
```

### Commande pour executer Valgrind durant l'utilisation du Minishell + logfile

```
valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --track-fds=yes \
         --verbose \
         --keep-debuginfo=yes \
         --suppressions=readline.supp \
         --log-file=valgrind-out.txt \
        ./minishell
```
