---
title: Intro
layout: post
---
Base text

```
DECLARE
  -- используем старую даты, зная, что на этот момент точно ничего нет
  vrb_date  VARCHAR2(26) := '2010-01-01 00:00:00.00'; --ввести дату восстановления в формате yyyy-mm-dd hh24:mi:ss.ff
  L_Jobno Number := 0;
  flsg_sleep Number := 1;
  Thread_Number Number := 0;
  thread_count Number := 20; --изменить количество потоков при необходимости. Для ПСИ - 20. Для ПРОМ - 50.
  CountJobs NUMBER       := 1;
BEGIN
  ${amc.db.username.customer}.Start_Amc_Customer_Repair(vrb_date, thread_count, 'Дата восстановления: '  || vrb_date || ', Количество потоков: ' || to_char(thread_count));
  ${amc.db.username.meta}.Start_Amc_Meta_Repair(vrb_date, thread_count, 'Дата восстановления: '  || vrb_date || ', Количество потоков: ' || to_char(thread_count) );
END;
```

<div class="gistcontainer" id="gist1">
  <a href="#gist1" class="show">More...</a>
  <script src="https://gist.github.com/benanne/3274371.js"></script>
</div>

```java
    @Test(dataProvider = "testDataProvider")
    public void test(final ITestCase testCase) throws Exception {
        // имеем вначале пустую БД - проверяем, что в конце так же будет пустая БД (кроме KM_AM_QUEUE)
        prepareTestCase(testCase);
        log.info("Sending message from test case << " + testCase.getCaseName() + " >> ...");
        sendMessagesAndCheckDBStateAfterUpdate(testCase);
        log.info("Rapair/restore DB to specific point in time...");
        callRepairToDate(testCase);
        log.info("Validating DB after 'repair' procedure...");
        // остаётся прежним, кроме KM_AM_QUEUE - т.к. он специально исключён из "отката"
        writeDbResultArtifactsAndCheck(testCase, "after_repair");
    }
```
