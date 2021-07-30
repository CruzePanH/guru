#  JUC - 类汇总和学习指南

TIP

本文对J.U.C进行知识体系解读，后续的文章还针对几乎所有的核心的类以及常用的`工具类`作了详细的解读; 如果没有时间详细阅读相关章节，可以跟着本文站在一定的高度了解JUC下包的设计和实现；同时对重要的章节提供跳转链接，您可以链接过去详读。

- JUC - 类汇总和学习指南
  - [带着BAT大厂的面试问题去理解](#带着bat大厂的面试问题去理解)
  - [Overview](#overview)
  - Lock框架和Tools类
    - [类结构总览](#类结构总览)
    - [接口: Condition](#接口-condition)
    - [接口: Lock](#接口-lock)
    - [接口: ReadWriteLock](#接口-readwritelock)
    - [抽象类: AbstractOwnableSynchonizer](#抽象类-abstractownablesynchonizer)
    - [抽象类(long): AbstractQueuedLongSynchronizer](#抽象类long-abstractqueuedlongsynchronizer)
    - [核心抽象类(int): AbstractQueuedSynchonizer](#核心抽象类int-abstractqueuedsynchonizer)
    - [锁常用类: LockSupport](#锁常用类-locksupport)
    - [锁常用类: ReentrantLock](#锁常用类-reentrantlock)
    - [锁常用类: ReentrantReadWriteLock](#锁常用类-reentrantreadwritelock)
    - [锁常用类: StampedLock](#锁常用类-stampedlock)
    - [工具常用类: CountDownLatch](#工具常用类-countdownlatch)
    - [工具常用类: CyclicBarrier](#工具常用类-cyclicbarrier)
    - [工具常用类: Phaser](#工具常用类-phaser)
    - [工具常用类: Semaphore](#工具常用类-semaphore)
    - [工具常用类: Exchanger](#工具常用类-exchanger)
  - Collections: 并发集合
    - [类结构关系](#类结构关系)
    - [Queue: ArrayBlockingQueue](#queue-arrayblockingqueue)
    - [Queue: LinkedBlockingQueue](#queue-linkedblockingqueue)
    - [Queue: LinkedBlockingDeque](#queue-linkedblockingdeque)
    - [Queue: ConcurrentLinkedQueue](#queue-concurrentlinkedqueue)
    - [Queue: ConcurrentLinkedDeque](#queue-concurrentlinkeddeque)
    - [Queue: DelayQueue](#queue-delayqueue)
    - [Queue: PriorityBlockingQueue](#queue-priorityblockingqueue)
    - [Queue: SynchronousQueue](#queue-synchronousqueue)
    - [Queue: LinkedTransferQueue](#queue-linkedtransferqueue)
    - [List: CopyOnWriteArrayList](#list-copyonwritearraylist)
    - [Set: CopyOnWriteArraySet](#set-copyonwritearrayset)
    - [Set: ConcurrentSkipListSet](#set-concurrentskiplistset)
    - [Map: ConcurrentHashMap](#map-concurrenthashmap)
    - [Map: ConcurrentSkipListMap](#map-concurrentskiplistmap)
  - Atomic: 原子类
    - [基础类型：AtomicBoolean，AtomicInteger，AtomicLong](#基础类型atomicbooleanatomicintegeratomiclong)
    - [数组：AtomicIntegerArray，AtomicLongArray，BooleanArray](#数组atomicintegerarrayatomiclongarraybooleanarray)
    - [引用：AtomicReference，AtomicMarkedReference，AtomicStampedReference](#引用atomicreferenceatomicmarkedreferenceatomicstampedreference)
    - [FieldUpdater：AtomicLongFieldUpdater，AtomicIntegerFieldUpdater，AtomicReferenceFieldUpdater](#fieldupdateratomiclongfieldupdateratomicintegerfieldupdateratomicreferencefieldupdater)
  - Executors: 线程池
    - [类结构关系](#类结构关系-1)
    - [接口: Executor](#接口-executor)
    - [ExecutorService](#executorservice)
    - [ScheduledExecutorService](#scheduledexecutorservice)
    - [AbstractExecutorService](#abstractexecutorservice)
    - [FutureTask](#futuretask)
    - [核心: ThreadPoolExecutor](#核心-threadpoolexecutor)
    - [核心: ScheduledThreadExecutor](#核心-scheduledthreadexecutor)
    - [核心: Fork/Join框架](#核心-forkjoin框架)
    - [工具类: Executors](#工具类-executors)
  - [参考文章](#参考文章)

## 带着BAT大厂的面试问题去理解

TIP

请带着这些问题继续后文，会很大程度上帮助你更好的理解相关知识点。

- JUC框架包含几个部分?
- 每个部分有哪些核心的类?
- 最最核心的类有哪些?

## Overview