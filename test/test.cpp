#include "sqr.h"
#include "gtest/gtest.h"

TEST(sqr_test, FailTest)
{
  EXPECT_EQ(5, sqr(2));
}

TEST(sqr_test, PassTest)
{
  EXPECT_EQ(4, sqr(2));
}
