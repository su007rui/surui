// src/app/page.tsx - 替代版本
import Image from "next/image";
import { MusicPlayer } from '@/components/ui/MusicPlayer'

export default function Home() {
  return (
    <div className="min-h-screen p-4 sm:p-8">
      <header className="container mx-auto mb-8">
        <Image
          className="dark:invert mb-4"
          src="/next.svg"
          alt="Next.js logo"
          width={180}
          height={38}
          priority
        />
      </header>

      <main className="container mx-auto">
        <h1 className="text-2xl font-bold mb-6">Music Player</h1>
        <MusicPlayer />
      </main>

      <footer className="container mx-auto mt-8 flex justify-center gap-6 text-sm text-gray-600">
        <a 
          href="https://nextjs.org/docs"
          target="_blank"
          rel="noopener noreferrer"
          className="hover:text-gray-900"
        >
          文档
        </a>
        <a 
          href="https://github.com"
          target="_blank"
          rel="noopener noreferrer"
          className="hover:text-gray-900"
        >
          GitHub
        </a>
      </footer>
    </div>
  )
}
