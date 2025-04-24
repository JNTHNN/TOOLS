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


### CPP05 ex02
```
// Test de l'opérateur = pour vérifier l'assignation de _target
    std::cout << "\n\033[33m======= TEST OPERATEUR '=' =======\033[0m" << std::endl;

    ShrubberyCreationForm originalForm("OriginalTarget");
    ShrubberyCreationForm assignedForm("TemporaryTarget");

    std::cout << "Avant l'assignation :" << std::endl;
    std::cout << "OriginalForm target: " << originalForm.getTarget() << std::endl;
    std::cout << "AssignedForm target: " << assignedForm.getTarget() << std::endl;

    // Utilisation de l'opérateur =
    assignedForm = originalForm;

    std::cout << "Après l'assignation :" << std::endl;
    std::cout << "OriginalForm target: " << originalForm.getTarget() << std::endl;
    std::cout << "AssignedForm target: " << assignedForm.getTarget() << std::endl;

    // Vérification
    if (assignedForm.getTarget() == originalForm.getTarget())
        std::cout << "\033[32mTest réussi : _target a été correctement assigné.\033[0m" << std::endl;
    else
        std::cout << "\033[31mTest échoué : _target n'a pas été correctement assigné.\033[0m" << std::endl;
```
