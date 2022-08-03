trigger RecursiveTrigger on Account (before insert,before update) 
{
    RecursiveTrigger.recursiveonce();
}