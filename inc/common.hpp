/**
 * @file common.hpp
 * @author 4Zephyr
 * @brief Template for your common codes.
 * @version 1.0
 * @date 2024-02-23
 *
 */

#include <bits/stdc++.h>
#include <fcntl.h>
#include <limits.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

using namespace std;

#define forn(s, n) for (int i(s); i < int(n); i++)
#define rforn(s, n) for (int i(s); i > int(n); i--)

#define err_exit(...)                                                                              \
    do {                                                                                           \
        printf(__VA_ARGS__);                                                                       \
        _exit(-1);                                                                                 \
    } while (0);

#define perror_exit(s)                                                                             \
    do {                                                                                           \
        perror(s);                                                                                 \
        _exit(-1);                                                                                 \
    } while (0);

#define ASSERT(v)                                                                                  \
    do {                                                                                           \
        if (v)                                                                                     \
            perror_exit("ASSERT");                                                                 \
    } while (0);
