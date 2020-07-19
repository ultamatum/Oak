#pragma once

#include "Juno/Core/Core.h"

namespace Juno
{
	struct FramebufferSpecification
	{
		uint32_t Width, Height;
		//FrameBufferFormat Format =;
		uint32_t Samples = 1;

		bool SwapChainTarget = false;
	};

	class Framebuffer
	{
		public:
			virtual void Bind() = 0;
			virtual void Unbind() = 0;

			virtual void Resize(uint32_t width, uint32_t height) = 0;

			virtual uint32_t GetColourAttachmentRendererID() const = 0;

			virtual const FramebufferSpecification& GetSpecification() const = 0;

			static Ref<Framebuffer> Create(const FramebufferSpecification& spec);
	};
}