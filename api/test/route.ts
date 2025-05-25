// api/test/route.ts
import { NextRequest, NextResponse } from 'next/server'
import { PrismaClient } from '@prisma/client'


const prisma = new PrismaClient()

export async function GET(request: NextRequest) {
  const searchParams = request.nextUrl.searchParams
  const query = searchParams.get('q')

  try {
    if (!query) {
      return NextResponse.json({ 
        message: "Search parameter is missing" 
      }, { status: 400 })
    }

    const songs = await prisma.song.findMany({
      where: {
        OR: [
          { title: { contains: query } },
          { artist: { contains: query } }
        ]
      }
    })

    return NextResponse.json(songs)
  } catch (error) {
    console.error('Search error:', error)
    return NextResponse.json({ 
      message: "An error occurred while searching" 
    }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const data = await request.json()
    const newPlaylist = await prisma.playlist.create({
      data: {
        title: data.title
      }
    })
    return NextResponse.json(newPlaylist)
  } catch (error) {
    console.error('Playlist creation error:', error)
    return NextResponse.json({ 
      message: "Error creating playlist" 
    }, { status: 500 })
  }
}
