#include "game_of_life.cuh"

GameOfLife *GameOfLife::ptr = NULL;

GameOfLife::GameOfLife(int t)
{
    b = t;
}

GameOfLife::~GameOfLife()
{
}
void GameOfLife::test(void)
{
}
GameOfLife::GameOfLife()
{
    ptr = this;
}