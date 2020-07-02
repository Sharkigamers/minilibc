/*
** EPITECH PROJECT, 2020
** unit_tests
** File description:
** unit_tests
*/

#include <criterion/criterion.h>
#include <criterion/redirect.h>

size_t _strlen(const char *);
char *_strchr(const char *, int c);
void *_memset(void *, int, size_t);
void *_memcpy(void *, const void *, size_t);
int _strcmp(const char *, const char *);
void *_memmove(void *, const void *, size_t);
int _strcasecmp(const char *, const char *);
char *_rindex(const char *, int);
char *_strstr(const char *, const char *);
char *_strpbrk(const char *, const char *);
size_t _strcspn(const char *, const char *);

void redirect_stdout()
{
    cr_redirect_stdout();
}

void redirect_stderr()
{
    cr_redirect_stderr();
}

Test(strlen, basic_strlen)
{
    cr_assert_eq(_strlen("test 123"), 8);
    cr_assert_eq(_strlen(""), 0);
}

Test(strchr, basic_strchr)
{
    cr_assert_str_eq(_strchr("je suis caca", 'c'), strchr("je suis caca", 'c'));
    cr_assert_eq(_strchr("je suis caca", 'p'), strchr("je suis caca", 'p'));
    cr_assert_eq(_strchr("", 'p'), strchr("", 'p'));
    cr_assert_str_eq(_strchr("teststsisa, issou la choncle", 's'), strchr("teststsisa, issou la choncle", 's'));
    cr_assert_str_eq(_strchr("teststsisa, issou la choncle", '\0'), strchr("teststsisa, issou la choncle", '\0'));
}

Test(memset, basic_memset)
{
    char *issou = malloc(sizeof(char) * 10);
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';

    cr_assert_str_eq(_memset(issou, 0, 10), memset(issou, 0, 10));
    cr_assert_str_eq(_memset(issou, 'd', 10), memset(issou, 'd', 10));
    cr_assert_str_eq(_memset(issou, 0, 5), memset(issou, 0, 5));
}

Test(memcopy, basic_memcopy)
{
    char *issou = malloc(sizeof(char) * 10);

    cr_assert_str_eq(_memcpy(issou, "Lopes", 5), memcpy(issou, "Lopes", 5));
    cr_assert_str_eq(_memcpy(issou, "Lopes", 2), memcpy(issou, "Lopes", 2));
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';
    cr_assert_str_eq(_memcpy(issou, "Lopes", 5), memcpy(issou, "Lopes", 5));
}

Test(strcmp, basic_strcmp)
{
    int first_value = 0;
    int second_value = 0;

    cr_assert_eq(_strcmp("ISSOU", "ISSOU"), strcmp("ISSOU", "ISSOU"));
    cr_assert_eq(_strcmp("issou1", "issou1"), strcmp("issou1", "issou1"));
    first_value = _strcmp("issou1", "issou123");
    second_value = strcmp("issou1", "issou123");
    if (first_value < 0)
        first_value = -1;
    else if (first_value > 0)
        first_value = 1;
    if (second_value < 0)
        second_value = -1;
    else if (second_value > 0)
        second_value = 1;
    cr_assert_eq(first_value, second_value);
}

Test(memmove, basic_memmove)
{
    char str[] = "issou-lopes";
    char str2[] = "foo-bar";
    char *issou = malloc(sizeof(char) * 10);

    cr_assert_eq(_memmove(&(str[3]), &(str[4]), 8),
    memmove(&(str[3]), &(str[4]), 8));
    cr_assert_eq(_memmove(&(str2[3]), &(str2[4]), 4),
    memmove(&(str2[3]), &(str2[4]), 4));
    cr_assert_str_eq(_memmove(issou, "Lopes", 5), memmove(issou, "Lopes", 5));
    cr_assert_str_eq(_memmove(issou, "Lopes", 2), memmove(issou, "Lopes", 2));
    issou[0] = 'i';
    issou[1] = 's';
    issou[2] = 's';
    issou[3] = 'o';
    issou[4] = 'u';
    issou[5] = '\0';
    cr_assert_str_eq(_memmove(issou, "Lopes", 5), memmove(issou, "Lopes", 5));
}

Test(strcasecmp, basic_strcasecmp)
{
    int first_value = 0;
    int second_value = 0;

    cr_assert_eq(_strcasecmp("ISSOU", "ISSOU"), strcasecmp("ISSOU", "ISSOU"));
    cr_assert_eq(_strcasecmp("ISSOU", "issou"), strcasecmp("ISSOU", "issou"));
    cr_assert_eq(_strcasecmp("IsSoU1", "issou1"),
    strcasecmp("IsSoU1", "issou1"));
    first_value = _strcasecmp("isSou1", "issou123");
    second_value = strcasecmp("isSou1", "issou123");
    if (first_value < 0)
        first_value = -1;
    else if (first_value > 0)
        first_value = 1;
    if (second_value < 0)
        second_value = -1;
    else if (second_value > 0)
        second_value = 1;
    cr_assert_eq(first_value, second_value);
}

Test(rindex, basic_rindex)
{
    cr_assert_str_eq(_rindex("Test lopes", 't'), rindex("Test lopes", 't'));
    cr_assert_eq(_rindex("Test lopes", 'z'), rindex("Test lopes", 'z'));
}

Test(strstr, basic_strstr)
{
    cr_assert_str_eq(_strstr("Test lopes", "Test"),
    strstr("Test lopes", "Test"));
    cr_assert_eq(_strstr("Test lopes", "issou"),
    strstr("Test lopes", "issou"));
    cr_assert_eq(_strstr("", "issou"), strstr("", "issou"));
    cr_assert_eq(_strstr("", ""), strstr("", ""));
    cr_assert_eq(_strstr("Test lopes", ""), strstr("Test lopes", ""));
    cr_assert_eq(_strstr("testesti", "testi"), strstr("testesti", "testi"));
}

Test(strpbrk, basic_strpbrk)
{
    cr_assert_str_eq(_strpbrk("issou je suis la", "ju"),
    strpbrk("issou je suis la", "ju"));
    cr_assert_eq(_strpbrk("issou je suis la", "z"),
    strpbrk("issou je suis la", "z"));
    cr_assert_eq(_strpbrk("issou je suis la", ""),
    strpbrk("issou je suis la", ""));
    cr_assert_eq(_strpbrk("", "ju"), strpbrk("", "ju"));
}

Test(strcspn, basic_strcspn)
{
    cr_assert_eq(_strcspn("issou", "chancla"), strcspn("issou", "chancla"));
    cr_assert_eq(_strcspn("issou", "choncle"), strcspn("issou", "choncle"));
    cr_assert_eq(_strcspn("abcde", "dpd"), strcspn("abcde", "dpd"));
    cr_assert_eq(_strcspn("abcde", ""), strcspn("abcde", ""));
    cr_assert_eq(_strcspn("", "abcde"), strcspn("", "abcde"));
}
