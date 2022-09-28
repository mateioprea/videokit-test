import {
  findNodeHandle,
  NativeModules,
  requireNativeComponent,
  ViewProps,
} from 'react-native'
import { useCallback, useMemo, useRef } from 'react'

type Props = {
  source: string
  repeat?: boolean
  resizeMode: any
  paused?: boolean
}

export const Video = requireNativeComponent<ViewProps & Props>('VideoKit')

type VideoModule = {
  play: (handle: number | null) => void
  pause: (handle: number | null) => void
  replay: (handle: number | null) => void
  seekToBeginning: (handle: number | null) => void
  isPlaying: (handle: number | null) => boolean
}

const VideoModule: VideoModule = NativeModules.AilaVideo

export const usePlayerControls = () => {
  const ref = useRef<any>()

  const getHandle = useCallback(() => findNodeHandle(ref.current), [ref])

  const play = useCallback(() => {
    const handle = getHandle()
    if (handle) VideoModule.play(handle)
  }, [getHandle])

  const pause = useCallback(() => {
    const handle = getHandle()
    if (handle) VideoModule.pause(handle)
  }, [getHandle])

  const replay = useCallback(() => {
    const handle = getHandle()
    if (handle) VideoModule.replay(handle)
  }, [getHandle])

  const isPlaying = useMemo(() => {
    return false
  }, [])

  const seekToBeginning = useCallback(() => {
    const handle = getHandle()
    VideoModule.seekToBeginning(handle)
  }, [getHandle])

  return {
    play,
    pause,
    replay,
    seekToBeginning,
    isPlaying,
    ref,
  }
}
